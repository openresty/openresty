# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

#worker_connections(1014);
#master_process_enabled(1);
log_level('debug');

repeat_each(1);

plan tests => repeat_each() * (blocks() * 5);

#no_diff();
no_long_string();

run_tests();

# INFO messages about skipped zone IDs are suppressed during configuration
# parsing. Check the usable resolver list rather than expecting those messages.

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
                ngx.say("failed to connect to openresty.org: ", err)
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
--- no_error_log
[error]
[crit]
--- error_log
parsed a resolver: "



=== TEST 2: malformed file
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
--- must_die
--- error_log
no name servers defined
--- no_error_log
[error]
[crit]
parsed a resolver: "
--- skip_nginx: 5: < 1.15.1



=== TEST 3: disabled
--- config
    resolver local=off ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
--- must_die
--- error_log
no name servers defined
--- no_error_log
[error]
[crit]
parsed a resolver: "
--- skip_nginx: 5: < 1.15.1



=== TEST 4: multiple resolvers
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"



=== TEST 5: CRLF
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"



=== TEST 6: CR only, with comments
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"



=== TEST 7: spaces and tabs before and after nameserver
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
                return
            end
            ngx.say("successfully connected to openresty.org")
            sock:close()
        }
    }
--- user_files eval
">>> resolv.conf
domain example.com
  \t \t  \tnameserver \t   \t 8.8.8.8
 \t  \t   \tnameserver\t   \t8.8.4.4"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"



=== TEST 8: MAXNS is respected (in standard Glibc it is 3)
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
nameserver 8.8.4.4
nameserver 208.67.222.222
nameserver 208.67.220.220"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"
parsed a resolver: "208.67.222.222"



=== TEST 9: IPv6 is supported
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location = /t {
        content_by_lua_block {
            ngx.say("done")
        }
    }
--- user_files eval
">>> resolv.conf
domain example.com
nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844"
--- request
GET /t
--- response_body
done
--- no_error_log
[crit]
[error]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "[2001:4860:4860::8888]"
parsed a resolver: "[2001:4860:4860::8844]"



=== TEST 10: IPv6 with malformed and long address
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location = /t {
        content_by_lua_block {
            ngx.say("done")
        }
    }
--- user_files eval
">>> resolv.conf
domain example.com
nameserver 2001:4860:4860::8888:2001:4860:4860::8888:2001
nameserver 2001:4860:4860::8844"
--- request
GET /t
--- response_body
done
--- no_error_log
[crit]
[error]
--- must_die
--- error_log
IPv6 resolver address is too long: "2001:4860:4860::8888:2001:4860:4860::8888:2001"
unable to parse local resolver



=== TEST 11: new line at the end of the file
--- config
    resolver local=../html/resolv.conf ipv6=off;
    resolver_timeout 5s;

    location /t {
        content_by_lua_block {
            local sock = ngx.socket.tcp()
            local ok, err = sock:connect("openresty.org", 80)
            if not ok then
                ngx.say("failed to connect to openresty.org: ", err)
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
nameserver 8.8.4.4
"
--- request
GET /t
--- response_body
successfully connected to openresty.org
--- no_error_log
[error]
[crit]
--- grep_error_log eval: qr/parsed a resolver: ".+"/
--- grep_error_log_out
parsed a resolver: "8.8.8.8"
parsed a resolver: "8.8.4.4"



=== TEST 12: skip IPv6 zone IDs without consuming MAXNS slots
--- config
    resolver local=../html/resolv.conf;

    location = /t {
        return 200 "done\n";
    }
--- user_files eval
">>> resolv.conf
nameserver fe80::9683:c4ff:fe35:ac1%enp1s0
nameserver fe80::1%2
nameserver 119.29.29.29
nameserver 2001:4860:4860::8888
nameserver 8.8.8.8
"
--- request
GET /t
--- response_body
done
--- no_error_log
[error]
[emerg]
--- grep_error_log eval: qr/(?:ignoring IPv6 resolver address with zone ID:|parsed a resolver:) ".+"/
--- grep_error_log_out
parsed a resolver: "119.29.29.29"
parsed a resolver: "[2001:4860:4860::8888]"
parsed a resolver: "8.8.8.8"



=== TEST 13: skip IPv6 zone ID at EOF without a newline
--- config
    resolver local=../html/resolv.conf;

    location = /t {
        return 200 "done\n";
    }
--- user_files eval
">>> resolv.conf
nameserver 119.29.29.29
nameserver fe80::9683:c4ff:fe35:ac1%enp1s0"
--- request
GET /t
--- response_body
done
--- no_error_log
[error]
[emerg]
--- grep_error_log eval: qr/(?:ignoring IPv6 resolver address with zone ID:|parsed a resolver:) ".+"/
--- grep_error_log_out
parsed a resolver: "119.29.29.29"



=== TEST 14: skip IPv6 zone IDs with CRLF and CR line endings
--- config
    resolver local=../html/resolv.conf;

    location = /t {
        return 200 "done\n";
    }
--- user_files eval
">>> resolv.conf
nameserver fe80::1%eth0\r\nnameserver 119.29.29.29\r\nnameserver fe80::2%3\rnameserver 2001:4860:4860::8888\r"
--- request
GET /t
--- response_body
done
--- no_error_log
[error]
[emerg]
--- grep_error_log eval: qr/(?:ignoring IPv6 resolver address with zone ID:|parsed a resolver:) ".+"/
--- grep_error_log_out
parsed a resolver: "119.29.29.29"
parsed a resolver: "[2001:4860:4860::8888]"



=== TEST 15: fail if all nameservers have IPv6 zone IDs
--- config
    resolver local=../html/resolv.conf;
--- user_files eval
">>> resolv.conf
nameserver fe80::1%eth0
"
--- must_die
--- error_log
no name servers defined
--- no_error_log
[warn]
ignoring IPv6 resolver address with zone ID:
unable to parse local resolver



=== TEST 16: skip IPv6 zone ID before checking the address length
--- config
    resolver local=../html/resolv.conf;

    location = /t {
        return 200 "done\n";
    }
--- user_files eval
">>> resolv.conf
nameserver fe80:0000:0000:0000:9683:c4ff:fe35:0ac1%enp1s0
nameserver 119.29.29.29
"
--- request
GET /t
--- response_body
done
--- no_error_log
[error]
[emerg]
--- grep_error_log eval: qr/(?:ignoring IPv6 resolver address with zone ID:|parsed a resolver:) ".+"/
--- grep_error_log_out
parsed a resolver: "119.29.29.29"



=== TEST 17: explicit resolver remains usable when local nameservers are skipped
--- config
    resolver local=../html/resolv.conf 119.29.29.29;

    location = /t {
        return 200 "done\n";
    }
--- user_files eval
">>> resolv.conf
nameserver fe80::1%eth0
"
--- request
GET /t
--- response_body
done
--- no_error_log
[error]
[emerg]
--- grep_error_log eval: qr/(?:ignoring IPv6 resolver address with zone ID:|parsed a resolver:) ".+"/
--- grep_error_log_out
