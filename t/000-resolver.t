# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

#worker_connections(1014);
#master_process_enabled(1);
log_level('warn');

#repeat_each(120);
repeat_each(2);

plan tests => repeat_each() * (blocks() * 2);

#no_diff();
#no_long_string();

run_tests();

__DATA__

=== TEST 1: use system resolver
--- config
    resolver local=on ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error
[error]
[crit]



=== TEST 2: malformed file
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
nameser 8.8.8.8"
--- request
GET /t
--- response_body
failed to connect to nil: no resolver defined to resolve "openresty.org"
--- no_error
[error]
[crit]



=== TEST 3: disabled
--- config
    resolver local=off ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
nameser 8.8.8.8"
--- request
GET /t
--- response_body
failed to connect to nil: no resolver defined to resolve "openresty.org"
--- no_error
[error]
[crit]



=== TEST 4: multiple resolvers
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
domain example.com
nameserver 8.8.8.8
nameserver 8.8.4.4"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error
[error]
[crit]



=== TEST 5: CRLF
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
domain example.com\r\nnameserver 8.8.8.8\r\nnameserver 8.8.4.4"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error
[error]
[crit]



=== TEST 6: CR only, with comments
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to ", server, ": ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
#domain example.com\rnameserver 8.8.8.8\rnameserver 8.8.4.4"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error
[error]
[crit]
