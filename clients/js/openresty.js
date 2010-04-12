var console, _log;
(function(){
if(typeof console == 'undefined'){
  _log = function(a, b, c){/*alert('' + a + b + c)*/};
}else{
  _log = function(){
    console.log.apply(console, arguments)
  };
}
})();


if (typeof window.OpenResty == "undefined") {
(function() {
var undefined;
var browser = (function(){
    var u = navigator.userAgent.toLowerCase(), a = /(msie|firefox|camino|chrome|opera|safari|netscape|konqueror|lynx)/, b = /(msie|firefox|chrome|opera|safari|camino|netscape|netscape6|konqueror|lynx|version)(\/|\s)([a-z0-9\.\+]*?)(\;|dev|rel|\s|$)/;
    var un = 'unknown', x = 'X', r = {
        name: (a.exec(u) || [un, un])[1]
    };
    r[r.name] = true;
    r.version = (b.exec(u) || [x, x, x, x])[3];
    return r;
})();

var OpenResty = {
    callbackMap: {},
    isDone: {},
    counter: 0
};

OpenResty.Client = function (params) {
    if (params == undefined) params = {};
    this.callback = params.callback;
    var server = params.server;
    if (!/^https?:\/\//.test(server)) {
        server = 'http://' + server;
    }
    this.server = server;
    this.user = params.user;
    //this.password = params.password;
};

var $ClientP = OpenResty.Client.prototype;
$ClientP.isSuccess = function (res) {
    // alert(JSON.stringify(res));
    return !(typeof res == 'object' && res.errcode);
};

$ClientP.logout = function () {
    this.get('/=/logout');
};

$ClientP.login = function (user, password) {
    this.user = user;
    var userCallback = this.callback;
    if (typeof userCallback == 'string') {
        userCallback = eval(userCallback);
    }

    var self = this;
    this.callback = function (data) {
        //alert(data.session);
        self.session = data.session;
        userCallback(data);
    };
    if (password == null)
        password = '';
    else
        password = hex_md5(password);
    //this.callback = 'save_session';
    this.get('/=/login/' + user + '/' + password);
};

$ClientP.postByGet = function (url) {
    var args, content;
    if (arguments.length == 3) {
        args = arguments[1];
        content = arguments[2];
    } else {
        content = arguments[1];
    }
    if (!args) args = {};
    url = url.replace(/^\/=\//, '/=/post/');
    content = JSON.stringify(content);
    //alert("type of content: " + typeof(content));
    //alert("content: " + content);
    args._data = content;
    this.get(url, args);
};

$ClientP.genId = (function (n) {
    //return ( Math.random() * 1000000 );
    return function() { return n++ };
    //return this.counter++;
})(new Date().getTime());

/*
  post: for large data transform
    crossdomain ~ y/n
    
    _post_by_form({
        form: form,
        url: fullURL,
        content: { data: content },
        preventCache: true,
        method: "post",
        handleAs: 'html',
        handle: function () {
            self.get('/=/last/response/' + args._last_response);
        }
    });
*/


var _post_forms_div,
    _post_forms = {};

OpenResty.Client._post_forms = _post_forms;

$ClientP._post_by_form = function (url, content, args) {
    if (!_post_forms_div) {
        _post_forms_div = document.createElement('div');
        var _s = _post_forms_div.style;
        _s.position = 'absolute';
        _s.left = '-1000px';
        _s.width = '500px';
        _s.height = '1px';
        _s.overflow = 'hidden';
        _s = null;
        document.body.appendChild(_post_forms_div);
    }
    
    var reqId = args._last_response;
    
    if (reqId in _post_forms) {
        throw "the post already exist!!";
    }
    
    var self = this;
    var obj = {
        reqId: reqId
    };
    _post_forms[reqId] = obj;
    var submited = false;
    // var onloadCount = 0;
    obj.onload = function() {
        if (!submited) return;
        
        // alert('contentLoad ' + (++onloadCount) + ' times\n' + this);
        
        var _iframe = obj.iframe;
        
        // maybe we can process response under same domain
        
        delete obj.onload;
        
        _post_forms_div.removeChild(_iframe);
        var _form = obj.form;
        _post_forms_div.removeChild(obj.form);
        
        _iframe = null;
        _form = null;
        
        delete obj.iframe;
        delete obj.form;
        
        delete _post_forms[reqId];
        
        obj = null;
        
        self.get('/=/last/response/' + reqId);
    };
    
    var form_id = 'OpenResty_form_' + reqId,
        iframe_id = 'OpenResty_iframe_' + reqId;
    
    var _5 = 'http://ajax.googleapis.com/ajax/libs/dojo/1.3.2/dojo/resources/blank.html';
    
    var _iframe;
    var _6 = browser.msie ? '<iframe name="' + iframe_id + '" src="' + _5 + '" onload="OpenResty.Client._post_forms[' + reqId + '].onload();">': "iframe";
    
    _iframe = document.createElement(_6);
    
    with(_iframe) {
        name = iframe_id;
        setAttribute("name", iframe_id);
        id = iframe_id;
    }
    
    if (!browser.msie) {
        _iframe.src = _5;
        _iframe.onload = OpenResty.Client._post_forms[reqId].onload;
    }
    
    _post_forms_div.appendChild(_iframe);
    obj.iframe = _iframe;
    
    var _form = document.createElement("form");
    
    var _22 = _form.getAttributeNode("action");
    var _23 = _form.getAttributeNode("method");
    var _24 = _form.getAttributeNode("target");

    if (_22) {
        _22.value = url;
    } else {
        _form.setAttribute("action", url);
    }

    if (_23) {
        _23.value = "post";
    } else {
        _form.setAttribute("method", "post");
    }
    
    if (_24) {
        _24.value = iframe_id;
    } else {
        _form.setAttribute("target", iframe_id);
    }
    
    _post_forms_div.appendChild(_form);
    obj.form = _form;
    
    var _ipt;
    if (browser.msie) {
        _ipt = document.createElement('<input type="hidden" name="data">');
    } else {
        _ipt = document.createElement("input");
        _ipt.name = "data";
        _ipt.type = "hidden";
    }
    _ipt.value = content;
    _form.appendChild(_ipt);
    
    _ipt = null;
    
    _form.submit();
    submited = true;
};

$ClientP.post = function (url) {
/*
    if (browser.opera) {  // work around an Opera bug
        return $ClientP.postByGet.apply(this, arguments);
    }*/

    try{
    var args, content;
    if (arguments.length == 3) {
        args = arguments[1];
        content = arguments[2];
    } else {
        content = arguments[1];
    }
    if (!args) args = {};
    //url = url.replace(/^\/=\//, '/=/post/');
    //if (url.match(/\?/)) throw "URL should not contain '?'.";
    if (!this.callback) throw "No callback specified for OpenResty.";
    
    // var formId = this.formId;
    // if (!formId) throw "No form specified.";

    if (this.session) args._session = this.session;
    if (!this.session && !args._user && this.user)
        args._user = this.user;

    args._last_response = this.genId();
    content = JSON.stringify(content);
    //alert("type of content: " + typeof(content));
    //alert("content: " + content);
    //args.callback = this.callback;
    //args.as_html = 1;

    var arg_list = new Array();
    for (var key in args) {
        arg_list.push(key + "=" + encodeURIComponent(args[key]));
    }
    //url += "?" + arg_list.join("&");

    var fullURL = this.server + url;
    if ( /\?$/.test(url) )
        fullURL += arg_list.join("&");
    else if ( /\?/.test(url) )
        fullURL += '&' + arg_list.join("&");
    else
        fullURL += '?' + arg_list.join("&");

    var self = this;
    //if (browser.opera) {  // work around an Opera bug
        //$("#" + formId).html($("#" + formId).html());
    //}
    //
    // var form = document.getElementById(formId);
    // form.method = 'POST';

    this._post_by_form(fullURL, content, args);
    }catch(ex){alert('error!!!: ' + ex)}
    /*
    var form = document.getElementById('new_model');
    form.action = this.server + url;
    form.method = 'POST';
    form.target = 'blah';
    $("input[@name='data']").val(content);
    form.submit();
    */
    //this.get(url, args);
    //
};

$ClientP.putByGet = function (url) {
    var args, content;
    if (arguments.length == 3) {
        args = arguments[1];
        content = arguments[2];
    } else {
        content = arguments[1];
    }
    if (!args) args = {};
    url = url.replace(/^\/=\//, '/=/put/');
    content = JSON.stringify(content);
    //alert("type of content: " + typeof(content));
    //alert("content: " + content);
    args._data = content;
    this.get(url, args);
};

$ClientP.put = function (url) {
    //if (browser.opera) {  // work around an Opera bug
        //return $ClientP.putByGet.apply(this, arguments);
    //}

    var args, content;
    if (arguments.length == 3) {
        args = arguments[1];
        content = arguments[2];
    } else {
        content = arguments[1];
    }
    if (!args) args = {};
    url = url.replace(/^\/=\//, '/=/put/');
    //alert("type of content: " + typeof(content));
    //alert("content: " + content);
    this.post(url, args, content);
};


$ClientP.get = function (url, args) {
    if (!args) args = {};
    if (!this.callback) throw "No callback specified for OpenResty.";
    if (!this.server) throw "No server specified for OpenResty.";
    //if (!this.user) throw "No user specified for OpenResty.";

    if (this.session) args._session = this.session;
    if (!this.session && !args._user && this.user)
        args._user = this.user;

    //args.password = this.password || '';
    //if (url.match(/\?/)) throw "URL should not contain '?'.";
    var reqId = this.genId();
    //args._rand = reqId;

    var onerror = this.onerror || function () { alert("Failed to do GET " + url) };
    
    //alert(args._rand);
    //if (!isLogin) args.user = this.user;
    //args.password = this.password;
    var callback = this.callback;
    if (typeof callback == 'string') {
        callback = eval(callback);
    }
    OpenResty.isDone[reqId] = false;
    this.callback = function (res) {
        //debug("In call back! " + reqId);
        OpenResty.isDone[reqId] = true;
        OpenResty.callbackMap[reqId] = null;
        callback(res);
    };
    OpenResty.callbackMap[reqId] = this.callback;
    args._callback = "OpenResty.callbackMap[" + reqId + "]";

    var headTag = document.getElementsByTagName('head')[0];

    var scriptTag = document.createElement("script");
    scriptTag.id = "openapiScriptTag" + reqId;
    scriptTag.className = '_openrestyScriptTag';
    var arg_list = new Array();
    for (var key in args) {
        arg_list.push(key + "=" + encodeURIComponent(args[key]));
    }

    var fullURL = this.server + url;
    if ( /\?$/.test(url) )
        fullURL += arg_list.join("&");
    else if ( /\?/.test(url) )
        fullURL += '&' + arg_list.join("&");
    else
        fullURL += '?' + arg_list.join("&");

    scriptTag.src = fullURL;
    scriptTag.type = "text/javascript";
    scriptTag.onload = scriptTag.onreadystatechange = function () {
        var done = OpenResty.isDone[reqId];
        if (done) {
            //alert("We're done!");
            setTimeout(function () {
                try {
                    headTag.removeChild(scriptTag);
                } catch (e) {}
            }, 0);
            return;
        }
        if (!this.readyState ||
                this.readyState == "loaded" ||
                this.readyState == "complete") {
            setTimeout(function () {
                if (!OpenResty.isDone[reqId]) {
                    //alert("reqId: " + reqId);
                    //debug("onerror firing... " + reqId);
                    onerror();
                    OpenResty.isDone[reqId] = true;
                    setTimeout(function () {
                        try {
                            headTag.removeChild(scriptTag);
                        } catch (e) {}
                    }, 0);
                }
            }, 50);
        }
    };
    setTimeout( function () {
        headTag.appendChild(scriptTag);
    }, 0);
};

$ClientP.del = function (url, args) {
    if (!args) args = {};
    url = url.replace(/^\/=\//, '/=/delete/');
    this.get(url, args);
};

window.OpenResty = OpenResty;
})();
}
