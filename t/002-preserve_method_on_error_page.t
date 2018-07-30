# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

repeat_each(1);

plan tests => repeat_each() * (blocks() * 3);

no_long_string();

run_tests();

__DATA__

=== TEST 1: error_page overrides HTTP method if not HEAD
--- config
        error_page 400 /err;

        location /t {
            return 400;
        }

        location /err {
            return 200 '$request_method';
        }
--- request
POST /t
--- error_code: 400
--- response_body chomp
GET
--- no_error_log
[error]



=== TEST 2: error_page does not override HTTP method if preserve_method_on_error_page is on
--- config
        error_page 400 /err;
        preserve_method_on_error_page on;

        location /t {
            return 400;
        }

        location /err {
            return 200 '$request_method';
        }
--- request
POST /t
--- error_code: 400
--- response_body chomp
POST
--- no_error_log
[error]
