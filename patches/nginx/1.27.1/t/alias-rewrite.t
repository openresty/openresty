use Test::Nginx::Socket;

repeat_each(1);
log_level('debug');

plan tests => repeat_each() * blocks() * 3;

run_tests();

__DATA__

=== TEST 1: reject alias mapping before rewritten URI selects a new location
--- config
    location /foo/ {
        alias /bar/;
        rewrite ^/foo/.*$ /x;
        return 200 $request_filename;
    }
--- request
GET /foo/1
--- response_body
--- error_code: 200
--- error_log
"alias" cannot be used in location "/foo/" where URI was rewritten


=== TEST 2: preserve alias mapping without a rewrite
--- config
    location /foo/ {
        alias /bar/;
        return 200 $request_filename;
    }
--- request
GET /foo/1
--- response_body chomp
/bar/1
--- error_code: 200
--- no_error_log
[alert]


=== TEST 3: allow alias mapping after selecting the new location
--- config
    location /foo/ {
        alias /unused/;
        rewrite ^/foo/(.*)$ /new/$1 last;
    }

    location /new/ {
        alias /bar/;
        return 200 $request_filename;
    }
--- request
GET /foo/1
--- response_body chomp
/bar/1
--- error_code: 200
--- no_error_log
[alert]


=== TEST 4: preserve root mapping during a rewrite
--- config
    location /foo/ {
        root /bar;
        rewrite ^/foo/.*$ /x;
        return 200 $request_filename;
    }
--- request
GET /foo/1
--- response_body chomp
/bar/x
--- error_code: 200
--- no_error_log
[alert]
