# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

log_level('debug');
repeat_each(1);

plan tests => repeat_each() * blocks() * 4;

run_tests();

__DATA__

=== TEST 1: successful response headers preserve the retry budget
--- http_config
    upstream backend {
        server 0.0.0.1;

        balancer_by_lua_block {
            local balancer = require "ngx.balancer"
            assert(balancer.set_current_peer("127.0.0.1",
                                             $TEST_NGINX_RAND_PORT_1))
        }
    }

    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_1;
        return 200 "ok\n";
    }
--- config
    location /t {
        proxy_pass http://backend;
    }
--- request
GET /t
--- response_body
ok
--- grep_error_log eval: qr/lua balancer: (?:get|free) peer, tries: \d+/
--- grep_error_log_out
lua balancer: get peer, tries: 1
lua balancer: free peer, tries: 1
--- no_error_log
[error]



=== TEST 2: successful cached responses preserve the retry budget
--- http_config
    upstream backend {
        server 0.0.0.1;
        keepalive 1;

        balancer_by_lua_block {
            local balancer = require "ngx.balancer"
            assert(balancer.set_current_peer("127.0.0.1",
                                             $TEST_NGINX_RAND_PORT_1))
        }
    }

    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_1;
        return 200 "$connection_requests\n";
    }
--- config
    location /t {
        content_by_lua_block {
            for i = 1, 2 do
                local res = ngx.location.capture("/proxy")
                ngx.print(res.status, ": ", res.body)
            end
        }
    }

    location /proxy {
        proxy_pass http://backend;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
    }
--- request
GET /t
--- response_body
200: 1
200: 2
--- grep_error_log eval: qr/lua balancer: (?:get|free) peer, tries: \d+/
--- grep_error_log_out
lua balancer: get peer, tries: 1
lua balancer: free peer, tries: 1
lua balancer: get peer, tries: 1
lua balancer: free peer, tries: 1
--- no_error_log
[error]



=== TEST 3: retryable response headers do not consume an extra try
--- http_config
    upstream backend {
        server 0.0.0.1;

        balancer_by_lua_block {
            local balancer = require "ngx.balancer"
            local tries = (ngx.ctx.tries or 0) + 1
            ngx.ctx.tries = tries

            if tries == 1 then
                assert(balancer.set_more_tries(1))
                assert(balancer.set_current_peer("127.0.0.1",
                                                 $TEST_NGINX_RAND_PORT_1))

            else
                assert(balancer.set_current_peer("127.0.0.1",
                                                 $TEST_NGINX_RAND_PORT_2))
            end
        }
    }

    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_1;
        return 502;
    }

    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_2;
        return 200 "ok\n";
    }
--- config
    location /t {
        proxy_pass http://backend;
        proxy_next_upstream http_502;
        proxy_next_upstream_tries 2;
    }
--- request
GET /t
--- response_body
ok
--- grep_error_log eval: qr/lua balancer: (?:get|free) peer, tries: \d+/
--- grep_error_log_out
lua balancer: get peer, tries: 1
lua balancer: free peer, tries: 2
lua balancer: get peer, tries: 1
lua balancer: free peer, tries: 1
--- no_error_log
[error]
