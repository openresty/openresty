# vim:set ft= ts=4 sw=4 et fdm=marker:
use Test::Nginx::Socket::Lua;
use Cwd qw(cwd);

plan tests => blocks() * repeat_each() * 3 + 2;

our $CWD = cwd();

$ENV{TEST_NGINX_RESOLVER} ||= '8.8.8.8';
$ENV{TEST_NGINX_HOSTS_FILE_PATH} = "$::CWD/t/fixtures/hosts";

run_tests()

__DATA__

=== TEST 1: does not resolve localhost without hostsfile
--- config
    resolver $TEST_NGINX_RESOLVER;

    location = /echo {
        echo "Hello";
    }

    location = /t {
        set $upstream localhost;
        proxy_pass http://$upstream:$TEST_NGINX_SERVER_PORT/echo;
    }
--- request
GET /t
--- error_code: 502
--- error_log
localhost could not be resolved (3: Host not found)



=== TEST 2: exits if file does not exists
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=/tmp/no_such_hostsfile;
--- must_die
--- error_log
open() "/tmp/no_such_hostsfile" failed (2: No such file or directory)
--- no_error_log
[error]



=== TEST 3: hostsfile option parses hosts file (--with-ipv6)
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /t {
        echo "Hello";
    }
--- request
GET /t
--- error_log eval
[
    qr/\[notice\] .*? host "localhost" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost\.dev" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost2" will resolve to "127\.0\.0\.2"/,
    qr/\[notice\] .*? host "localhost-v6" will resolve to "::1"/,
]
--- no_error_log
[error]
host "ignoreme" will resolve to "172.168.0.1"
--- skip_eval: 3: system("ping6 -c 1 ::1 >/dev/null 2>&1") eq 0



=== TEST 4: hostsfile option parses hosts file (--without-ipv6)
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /t {
        echo "Hello";
    }
--- request
GET /t
--- error_log eval
[
    qr/\[notice\] .*? host "localhost" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost\.dev" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost2" will resolve to "127\.0\.0\.2"/,
]
--- no_error_log
[error]
host "ignoreme" will resolve to "172.168.0.1"
host "localhost-v6" will resolve to "::1",
--- skip_eval: 3: system("ping6 -c 1 ::1 >/dev/null 2>&1") ne 0



=== TEST 5: hostsfile option caches parsed hostnames
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /echo {
        echo "Hello";
    }

    location = /t {
        set $upstream localhost;
        proxy_pass http://$upstream:$TEST_NGINX_SERVER_PORT/echo;
    }
--- request
GET /t
--- response_body
Hello
--- no_error_log
[error]



=== TEST 6: hostsfile option caches parsed hostnames (bis)
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /echo {
        echo "Hello";
    }

    location = /t {
        set $upstream localhost.dev;
        proxy_pass http://$upstream:$TEST_NGINX_SERVER_PORT/echo;
    }
--- request
GET /t
--- response_body
Hello
--- no_error_log
[error]



=== TEST 7: hostsfile option honors ipv6=off flag
--- config
    resolver $TEST_NGINX_RESOLVER hostsfile=$TEST_NGINX_HOSTS_FILE_PATH ipv6=off;

    location = /t {
        echo "Hello";
    }
--- request
GET /t
--- response_body
Hello
--- error_log eval
[
    qr/\[notice\] .*? host "localhost" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost\.dev" will resolve to "127\.0\.0\.1"/,
    qr/\[notice\] .*? host "localhost2" will resolve to "127\.0\.0\.2"/,
]
--- no_error_log
host "localhost-v6" will resolve to "::1"
--- skip_eval: 3: system("ping6 -c 1 ::1 >/dev/null 2>&1") eq 0



=== TEST 8: resolver without nameserver are accepted
--- config
    resolver hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /t {
        echo "Hello";
    }
--- request
GET /t
--- response_body
Hello
--- no_error_log
[error]



=== TEST 9: resolver without nameserver and without hostsfile still errors out
--- config
    resolver;
--- must_die
--- error_log
invalid number of arguments in "resolver" directive
--- no_error_log
[error]



=== TEST 10: resolver without nameserver returns cached hostnames from hostsfile
--- config
    resolver hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /echo {
        echo "Hello";
    }

    location = /t {
        set $upstream localhost;
        proxy_pass http://$upstream:$TEST_NGINX_SERVER_PORT/echo;
    }
--- request
GET /t
--- response_body
Hello
--- no_error_log
[error]



=== TEST 11: resolver without nameserver returns proper error when no cached hostname
--- config
    resolver hostsfile=$TEST_NGINX_HOSTS_FILE_PATH;

    location = /t {
        set $upstream openresty.org;
        proxy_pass http://$upstream/;
    }
--- request
GET /t
--- error_code: 502
--- error_log
openresty.org could not be resolved (3: Host not found)
