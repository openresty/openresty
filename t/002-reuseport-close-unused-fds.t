# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

master_on();
workers(2);
log_level('debug');

repeat_each(1);

plan tests => repeat_each() * (blocks() * 3);

no_long_string();

run_tests();

__DATA__

=== TEST 1: closes unused file descriptors when 'reuseport' is enabled
--- http_config
    server {
        listen 127.0.0.1:11111 reuseport;
    }
--- config
    location /t {
        return 200;
    }
--- request
GET /t
--- ignore_response_body
--- no_error_log
[error]
--- grep_error_log eval: qr/\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111/
--- grep_error_log_out eval
qr/\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
/



=== TEST 2: closes multiple unused file descriptors when 'reuseport' is enabled
--- http_config
    server {
        listen 127.0.0.1:11111 reuseport;
    }

    server {
        listen 127.0.0.2:11111 reuseport;
    }
--- config
    location /t {
        return 200;
    }
--- request
GET /t
--- ignore_response_body
--- no_error_log
[error]
--- grep_error_log eval: qr/\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.\d+:11111/
--- grep_error_log_out eval
qr/(\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.2:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.2:11111)|(\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.1:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.2:11111
\[debug\] .*? closing unused fd:\d+ listening on 127\.0\.0\.2:11111)
/



=== TEST 3: does not close any fd if 'reuseport' is not used
--- http_config
    server {
        listen 127.0.0.1:11111;
    }
--- config
    location /t {
        return 200;
    }
--- request
GET /t
--- ignore_response_body
--- no_error_log
[error]
closing unused fd
