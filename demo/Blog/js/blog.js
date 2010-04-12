var account = 'agentzh';
//var host = 'http://10.32.24.16:8080';
var host = 'http://localhost:8080';
//var host = 'http://api.eeeeworks.org';
//var host = 'http://api.openresty.org';
//var host = 'http://10.62.136.86';

var openresty = null;
var savedAnchor = null;
var itemsPerPage = 5;
var loadingCount = 0;
var waitMessage = null;
var timer = null;
var thisYear = null;
var thisMonth = null;
var thisDay = null;
var cachedPostCountRes = null;

var months = [
    null,
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
];

$(window).ready(init);

function error (msg) {
    alert(msg);
}

function debug (msg) {
    $("#copyright").append(msg + "<br/>");
}


$.fn.postprocess = function (className, options) {
    return this.find("a[@href*='#']").each( function () {
        //debug("HERE!");
        var href = $(this).attr('href');
        // We need the following hack because IE expands href to
        // absolute URL:
        var anchor = href.replace(/^.*?\#/, '');
        //debug("Anchor: " + anchor);
        $(this).click( function () {
            //debug(location.hash);
            //$(".bnchor-location")[0].id = anchor;
            location.hash = anchor;
            //alert(location.hash);
            if (savedAnchor == anchor) savedAnchor = null;
            dispatchByAnchor();
        } );
    } );
};

//var count = 0;;
function setStatus (isLoading, category) {
    if (isLoading) {
        if (++loadingCount == 1) {
            if (jQuery.browser.opera)
                $(waitMessage).css('top', '2px');
            else
                $(waitMessage).show();
        }
    } else {
        loadingCount--;
        if (loadingCount < 0) loadingCount = 0;
        if (loadingCount == 0) {
            // the reason we use this hack is to work around
            // a rendering bug in Win32 build of Opera
            // (at least 9.25 and 9.26)
            if (jQuery.browser.opera)
                $(waitMessage).css('top', '-200px');
            else
                $(waitMessage).hide();

        }
    }
    //count++;
    //debug("[" + count + "] setStatus: " + category + ": " + loadingCount + "(" + isLoading + ")");
}

function init () {
    loadingCount = 0;
    var now = new Date();
    thisYear = now.getFullYear();
    thisMonth = now.getMonth();
    thisDay = now.getDate();

    waitMessage = document.getElementById('wait-message');
    openresty = new OpenResty.Client(
        { server: host, user: account + '.Public' }
    );
    //openresty.formId = 'new_model';
    if (timer) {
        clearInterval(timer);
    }
    dispatchByAnchor();
    timer = setInterval(dispatchByAnchor, 600);
    //debug("before getSidebar...");
    getSidebar();
}

function resetAnchor () {
    var anchor = location.hash;
    location.hash = anchor.replace(/^\#/, '');
}

function dispatchByAnchor () {
    //debug(location.hash);
    var anchor = location.hash;
    anchor = anchor.replace(/^\#/, '');
    if (savedAnchor == anchor)
        return;
    if (anchor == "") {
        anchor = 'posts/1';
        location.hash = 'posts/1';
    }
    savedAnchor = anchor;

    // prevent memory leaks from dynamically created <script> nodes:
    //if (loadingCount <= 0) openresty.purge();
    loadingCount = 0;

    var match = anchor.match(/^post-(\d+)(:comments|comment-(\d+))?/);
    if (match) {
        var postId = match[1];
        //alert("Post ID: " + postId);
        getPost(postId);
        return;
    }

    match = anchor.match(/^search\/(\d+)\/(.*)/);
    if (match) {
        var page = parseInt(match[1]);
        var query = match[2];
        $('.pager').html('');

        $('#searchbox').val(query);
        getSearchResults(query, page);
        getPagerForSearch(query, page);
        return;
    }

    match = anchor.match(/^archive\/(\d+)\/(\d+)$/);
    if (match) {
        var year = match[1];
        var month = match[2];
        getArchive(year, month);
        return;
    }
    match = anchor.match(/^(?:posts|posts\/(\d+))$/);
    var page = 1;
    //alert(anchor + " " + location.hash);
    if (match)
        page = parseInt(match[1]) || 1;
    else if (anchor != 'posts/1')
        top.location.hash = 'posts/1';

    //debug("before getPostList...");
    getPostList(page);
    //debug("before getPager...");
    getPager(page);
    //debug("after getPager...");

    $(".blog-top").attr('id', 'posts/' + page);
}

function getArchive (year, month) {
    setStatus(true, 'renderPostList');
    $(".pager").html('');
    openresty.callback = function (res) {
        renderPostList(res);
        setStatus(true, 'renderArchiveNav');
        openresty.callback = renderArchiveNav;
        openresty.get(
            '/=/view/PrevNextArchive/~/~',
            {
                now: year + '-' + month + '-01',
                month: month,
                months: months
            }
        );
    };
    openresty.get(
        '/=/view/FullPostsByMonth/~/~',
        { count: 40, year: year, month: month }
    );
    $(".blog-top").attr('id', 'archive/' + year + '/' + month);
}

function renderArchiveNav (res) {
    //debug("render archive nav: " + JSON.stringify(res));
    setStatus(false, 'renderArchiveNav');
    if (!openresty.isSuccess(res)) {
        error("Failed to get archive navigator: " + res.errstr);
        return;
    }
    var prev = null;
    var next = null;
    for (var i = 0; i < res.length; i++) {
        var item = res[i];
        item.year = parseInt(item.year);
        item.month = parseInt(item.month);
        //debug("item: " + JSON.stringify(item));
        if (item.id == "prev") prev = item;
        else if (item.id == "next")  next = item;
    }
    //debug("next: " + JSON.stringify(next));
    //debug("prev: " + JSON.stringify(prev));
    $("#post-list-nav").html(
        Jemplate.process(
            'archive-nav.tt',
            { next: next, prev: prev, months: months }
        )
    ).postprocess();
}

function getPostList (page) {
    setStatus(true, 'renderPostList');
    openresty.callback = renderPostList;
    openresty.get('/=/model/Post/~/~', {
        _limit: itemsPerPage,
        _order_by: 'id:desc',
        _offset: itemsPerPage * (page - 1)
    });
}

function getSearchResults (query, page) {
    setStatus(true, 'renderSearchResults');
    openresty.callback = function (res) { renderSearchResults(res, query); };
    var q = query2tsquery(query);
    //alert("Query: " + q);
    openresty.get('/=/view/PostSearch/~/~', {
        offset: itemsPerPage * (page - 1),
        count: itemsPerPage,
        query: q,
        order_dir: 'desc'
    });
}

function doPostSearch () {
    var query = $('#searchbox').val();
    savedAnchor = null;
    var anchor = '#search/1/' + query;
    location.hash = anchor;
    //alert(location.hash);
    if (savedAnchor == anchor.replace(/^\#/, '')) savedAnchor = null;
    dispatchByAnchor();
}

function query2tsquery (query) {
    return query.replace(/[\s(){},.|&$]+/g, ' ')
                 .replace(/^\s+|\s+$/g, '')
                 .replace(/ +/g, '|');
}

function getPagerForSearch (query, page) {
    setStatus(true, 'renderPagerForSearch');
    openresty.callback = function (res) { renderPager(res, page, 'search/', '/' + query); };
    var q = query2tsquery(query);
    openresty.get('/=/view/RowCountForSearch/~/~', {query: q});
}

function getPager (page) {
    setStatus(true, 'renderPager');
    if (cachedPostCountRes) {
        //alert("Hit!");
        renderPager(cachedPostCountRes, page, 'posts/', '');
    } else {
        openresty.callback = function (res) { renderPager(res, page, 'posts/', ''); };
        openresty.get('/=/view/RowCount/~/~', { model: 'Post' });
    }
}

function getSidebar () {
    //getRecentPosts();
    //getRecentComments();
    //getArchiveList();
    setStatus(true, 'renderSidebar');
    openresty.callback = function (res) { renderSidebar(res) };
    openresty.get('/=/batch/GetSidebar/~/~', { year: thisYear, month: thisMonth + 1 });
}

function renderSidebar (res) {
    setStatus(false, 'renderSidebar');

    if (!openresty.isSuccess(res)) {
        error("Failed to fetch posts for calendar: " +
            res.errstr);
        return;
    }

    getCalendar(thisYear, thisMonth, res[0]);

    setStatus(true, 'renderRecentPosts');
    renderRecentPosts(res[1], 0, 6);

    setStatus(true, 'renderRecentComments');
    renderRecentComments(res[2], 0, 6);

    setStatus(true, 'getArchiveList');
    renderArchiveList(res[3], 0, 12);
}

function getCalendar (year, month, posts) {
    if (year == undefined || month == undefined) {
        year = thisYear;
        month = thisMonth;
    }
    var date = new Date(year, month, 1);
    var first_day_of_week = date.getDay();
    var end_of_month;
    if (month == 11) {
        end_of_month = 31;
    } else {
        var delta = new Date(year, month + 1, 1) - date;
        end_of_month = Math.round(delta/1000/60/60/24);
    }
    //alert(year);
    //alert(month);
    //alert("thisday: " + thisDay);
    $(".module-calendar").html(
        Jemplate.process(
            'calendar.tt',
            {
                year: year,
                month: month,
                first_day_of_week: first_day_of_week,
                end_of_month: end_of_month,
                today: (year == thisYear && month == thisMonth) ?
                        thisDay : null,
                months: months
            }
        )
    ).postprocess();

    // We need this 0 timeout hack for IE 6 :(
    if (posts) {
        //alert("Shortcut!");
        setStatus(true, 'renderPostsInCalendar');
        renderPostsInCalendar(posts, year, month);
    } else {
        setTimeout( function () {
            setStatus(true, 'renderPostsInCalendar');
            openresty.callback = function (res) {
                renderPostsInCalendar(res, year, month);
            };
            openresty.get('/=/view/PostsByMonth/~/~', { year: year, month: month + 1 });
        }, 0 );
    }
}

function renderPostsInCalendar (res, year, month) {
    setStatus(false, 'renderPostsInCalendar');
    //alert("hey!");
    if (!openresty.isSuccess(res)) {
        error("Failed to fetch posts for calendar: " +
            res.errstr);
    } else {
        //alert(res.errstr);
        var prev_day = 0;
        for (var i = 0; i < res.length; i++) {
            var line = res[i];
            if (prev_day == line.day) continue;
            prev_day = line.day;
            var id = 'day-' + year + '-' + month + '-' + line.day;
            //alert("ID: " + id);
            var cell = $("#" + id);
            if (cell.length == 0) return;
            //alert("cell html: " + cell.html());
            cell.html('<a href="#post-' + line.id + '"><b>' +
                cell.html() + '</b></a>').postprocess();
        }
    }
}

function getRecentComments (offset) {
    if (!offset) offset = 0;
    setStatus(true, 'renderRecentComments');
    openresty.callback = function (res) { renderRecentComments(res, offset, 6) };
    openresty.get('/=/view/RecentComments/~/~',
            { limit:6, offset: offset });
}

function renderRecentComments (res, offset, count) {
    setStatus(false, 'renderRecentComments');
    if (!openresty.isSuccess(res)) {
        error("Failed to get the recent comments: " + res.errstr);
    } else {
        //alert("Get the recent comments: " + res.errstr);
        var html = Jemplate.process(
            'recent-comments.tt',
            { comments: res, offset: offset, count: count  }
        );
        $("#recent-comments").html(html).postprocess();
    }
}

function getRecentPosts (offset) {
    if (!offset) offset = 0;
    setStatus(true, 'renderRecentPosts');
    openresty.callback = function (res) { renderRecentPosts(res, offset, 6) };
    openresty.get('/=/view/RecentPosts/~/~',
            { limit:6, offset: offset });
}

function renderRecentPosts (res, offset, count) {
    setStatus(false, 'renderRecentPosts');
    if (!openresty.isSuccess(res)) {
        error("Failed to get the recent posts: " + res.errstr);
    } else {
        //alert("Get the recent comments: " + res.errstr);
        var html = Jemplate.process(
            'recent-posts.tt',
            { posts: res, offset: offset, count: count  }
        );
        $("#recent-posts").html(html).postprocess();
    }
}

function getArchiveList (offset) {
    if (offset == undefined) offset = 0;
    setStatus(true, 'getArchiveList');
    openresty.callback = function (res) {
        renderArchiveList(res, offset, 12);
    };
    openresty.get(
        '/=/view/PostCountByMonths/~/~',
        { offset: offset, count: 12 }
    );
}

function renderArchiveList (res, offset, count) {
    setStatus(false, 'getArchiveList');
    if (!openresty.isSuccess(res)) {
        error("Failed to get archive list: " + res.errstr);
        return;
    }
    for (var i = 0; i < res.length; i++) {
        var item = res[i];
        var match = item.year_month.match(/^(\d\d\d\d)-0?(\d+)/);
        if (match) {
            item.year = parseInt(match[1]);
            item.month = parseInt(match[2]);
        } else {
            error("Failed to match against year_month: " + item.year_month);
        }
        //debug(JSON.stringify(item));
    }
    $("#archive-list").html(
        Jemplate.process(
            'archive-list.tt',
            { archives: res, count: count, offset: offset, months: months }
        )
    ).postprocess();
}

function postComment (form) {
    var data = {};
    data.sender = $("#comment-author").val();
    data.email = $("#comment-email").val();
    data.url = $("#comment-url").val();
    data.body = $("#comment-text").val();
    data.post_id = $("#comment-for").val();
    //alert(JSON.stringify(data));
    if (!data.sender) {
        error("Name is required.");
        return false;
    }
    if (!data.email) {
        error("Email address is required.");
        return false;
    }
    if (!data.body) {
        error("Comment body is required.");
        return false;
    }

    //openresty.purge();
    setStatus(true, 'afterPostComment');
    openresty.callback = afterPostComment;
    //openresty.formId = 'comment-form';
    // TODO openresty.post('/=/batch/NewComment/~/~', data);
    openresty.get('/=/batch/NewComment/~/~', data);
    return false;
}

function afterPostComment (res) {
    setStatus(false, 'afterPostComment');
    //alert("HERE!!! afterPostComment");
    if (!openresty.isSuccess(res)) {
        error("Failed to post the comment: " + res.errstr);
    } else {
        //alert(res.errstr);
        $("#comment-text").val('');
        var spans = $(".comment-count");
        var commentCount = parseInt(spans.text());
        var postId = spans.attr('post');

        //debug(JSON.stringify(res));
        var commentId = res[0].insert_id;
        location.hash = 'post-' + postId + ':' +
            (commentId ? 'comment-' + commentId : 'comments');
        spans.text(commentCount + 1);
        getRecentComments(0);
    }
}

function getPost (id) {
    //alert("Go to Post " + id);
    $(".blog-top").attr('id', 'post-' + id);
    //alert($(".blog-top").attr('id'));
    setStatus(true, 'renderPost');
    openresty.callback = renderPost;
    openresty.get('/=/batch/GetFullPost/~/~',
            { id: id });
}

function renderPost (res) {
    setStatus(false, 'renderPost');
    //alert(JSON.stringify(post));
    if (!openresty.isSuccess(res)) {
        error("Failed to render post: " + res.errstr);
    } else {
        var post = res[0][0];
        //if (!post) return;
        $("#beta-inner.pkg").html(
            Jemplate.process('post-page.tt', { post: post })
        ).postprocess();

        renderPrevNextPost(post.id, res[1]);
        //debug(JSON.stringify(post));

        setStatus(true, 'renderComments');
        renderComments(res[2]);
        $(".pager").html('');
        resetAnchor();
    }
}

function renderPrevNextPost (currentId, res) {
    if (!openresty.isSuccess(res)) {
        error("Failed to render prev next post navigation: " +
            res.errstr);
    } else {
        //alert("Going to render prev next post navigation: " + res.errstr);
        $(".content-nav").html(
            Jemplate.process('nav.tt', { posts: res, current: currentId })
        ).postprocess();
        //resetAnchor();
    }
}

function renderComments (res) {
    setStatus(false, 'renderComments');
    //alert("Comments: " + res.errstr);
    if (!openresty.isSuccess(res)) {
        error("Failed to get post list: " + res.errstr);
    } else {
        $(".comments-content").html(
            Jemplate.process('comments.tt', { comments: res })
        );
        //resetAnchor();
        //setTimeout( function () { alert("Hi"); resetAnchor(); }, 1000 );
    }
}

function renderPostList (res) {
    setStatus(false, 'renderPostList');
    if (!openresty.isSuccess(res)) {
        error("Failed to get post list: " + res.errstr);
    } else {
        //alert(JSON.stringify(data));
        $("#beta-inner.pkg").html(
            Jemplate.process('post-list.tt', { post_list: res })
        ).postprocess();
    }
    //resetAnchor();
}

function renderSearchResults (res, query) {
    setStatus(false, 'renderSearchResults');
    if (!openresty.isSuccess(res)) {
        error("Failed to get search results: " + res.errstr);
    } else {
        if (res.length) {
            var html = Jemplate.process('post-list.tt', { post_list: res })
            $("#beta-inner.pkg").html(html).postprocess();
        } else {
            $("#beta-inner.pkg").html("<p>Sorry, no search results found for query <b>\"" + query + "\"</b>.</p>");
        }
    }
}

function renderPager (res, page, prefix, suffix) {
    setStatus(false, 'renderPager');
    if (!openresty.isSuccess(res)) {
        error("Failed to render pager: " + res.errstr);
    } else {
        //debug("before rendering pager...");
        cachedPostCountRes = res;
        var pageCount = Math.ceil(parseInt(res[0].count) / itemsPerPage);
        if (pageCount < 2) return;
        //debug("before redering pager (2)...");
        var html = Jemplate.process(
            'pager.tt',
            { page: page, page_count: pageCount, title: 'Pages', prefix: prefix, suffix: suffix }
        );
        //debug("after html generation...");

        // we use the .each hack here to work aound a JS runtime error in IE 6:
        $(".pager").each( function () {
            $(this).html( html ).postprocess();
        } );
        //debug("after rendering pager...");
        resetAnchor();
    }
}

