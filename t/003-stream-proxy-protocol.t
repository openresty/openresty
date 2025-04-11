# vim:set ft= ts=4 sw=4 et fdm=marker:
use Test::Nginx::Socket::Lua::Stream;
master_on();
workers(2);
log_level('debug');

repeat_each(2);
plan tests => 14 * repeat_each();

#no_diff();
no_long_string();

run_tests();


__DATA__

=== TEST 1: Stream to HTTP proxy with Proxy Protocol v2
--- stream_config
    upstream backend {
        server 127.0.0.1:$TEST_NGINX_RAND_PORT_2 max_fails=3 fail_timeout=5s;
    }

--- stream_server_config
    proxy_pass backend;
    proxy_protocol v2;
--- http_config
    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_2 proxy_protocol;

        location /t1 {
            echo "hello world";
        }
    }
--- stream_request eval
"GET /t1 HTTP/1.0\r\nHost: localhost\r\n\r\n";
--- stream_response_like
hello world
--- no_error_log
[error]
--- grep_error_log eval:  qr/PROXY protocol v2 src:.*/
--- grep_error_log_out eval
qr/PROXY protocol v2 src: 127\.0\.0\.1 \d+, dst: 127\.0\.0\.1 \d+/



=== TEST 2: Stream with Proxy Protocol tunnel (IPV4)
--- stream_config
    upstream backend {
        server 127.0.0.1:$TEST_NGINX_RAND_PORT_2 max_fails=3 fail_timeout=5s;
    }
--- stream_server_config
    proxy_pass backend;
    set_real_ip_from  127.0.0.1/32;
    proxy_protocol v2;
--- steam_listen_option
proxy_protocol
--- http_config
    server {
        set_real_ip_from  127.0.0.1/32;
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_2 proxy_protocol;

        location /t2 {
            echo "$proxy_protocol_addr via proxy protocol v2";
        }
    }
--- stream_request eval
    "PROXY TCP4 1.1.1.1 127.0.0.1 48078 1985\r\nGET /t2 HTTP/1.0\r\nHost: localhost\r\n\r\n";
--- stream_response_like
1.1.1.1 via proxy protocol v2
--- grep_error_log eval:  qr/PROXY protocol v2 src:.*/
--- grep_error_log_out eval
qr/PROXY protocol v2 src: 1\.1\.1\.1 \d+, dst: 127\.0\.0\.1 \d+/
--- no_error_log
[error]



=== TEST 3: Stream with Proxy Protocol tunnel (IPV6)
--- stream_config
    upstream backend {
        server [::1]:$TEST_NGINX_RAND_PORT_2 max_fails=3 fail_timeout=5s;
    }
--- stream_server_config
    proxy_pass backend;
    set_real_ip_from  127.0.0.1/32;
    proxy_protocol v2;
--- steam_listen_option
proxy_protocol
--- http_config
    server {
        listen [::1]:$TEST_NGINX_RAND_PORT_2 proxy_protocol;
        location /t3 {
            echo "$proxy_protocol_addr via proxy protocol v2 IPv6";
        }
    }
--- stream_request eval
    "PROXY TCP6 2001:0db8:85a3:0000:0000:8a2e:0370:7334 ::1 48078 1985\r\nGET /t3 HTTP/1.0\r\nHost: localhost\r\n\r\n";
--- stream_response_like
2001:db8:85a3::8a2e:370:7334 via proxy protocol v2 IPv6
--- no_error_log
[error]



=== TEST 4: Stream with TLS Extended Property Validation
--- stream_config
    upstream backend {
        server 127.0.0.1:$TEST_NGINX_RAND_PORT_2 max_fails=3 fail_timeout=5s;
    }
    server {
        listen 12344  ssl;
        proxy_pass backend;
        proxy_protocol v2;
        ssl_certificate test.crt;
        ssl_certificate_key test.key;
    }
--- stream_server_config
    proxy_pass 127.0.0.1:12344;
    proxy_ssl on;
--- http_config
    server {
        listen 127.0.0.1:$TEST_NGINX_RAND_PORT_2 proxy_protocol;
        location /t4 {
            echo "$proxy_protocol_addr $proxy_protocol_tlv_ssl_version   $proxy_protocol_tlv_ssl_cipher  $proxy_protocol_tlv_ssl_sig_alg $proxy_protocol_tlv_ssl_key_alg  $proxy_protocol_tlv_ssl_verify via proxy protocol v2 IPv4";
        }
    }
--- post_setup_server_root
my $d = "t/servroot/conf";
open my $fh, '>', "$d/openssl.conf" or die "can`t open $d/openssl.conf: $!";
print $fh <<'END';
[ req ]
default_bits = 2048
encrypt_key = no
distinguished_name = req_distinguished_name
x509_extensions = myca_extensions
[ req_distinguished_name ]
[ myca_extensions ]
basicConstraints = critical,CA:TRUE
END
close $fh;

foreach my $name ('test') {
	system('openssl req -x509 -new '
		. "-config $d/openssl.conf -subj /CN=$name/ "
		. "-out $d/$name.crt -keyout $d/$name.key "
		. ">>$d/openssl.out 2>&1") == 0
	or die "Can't create certificate for $name: $!\n";
}

--- stream_request eval
    "GET /t4 HTTP/1.0\r\nHost: localhost\r\n\r\n";
--- stream_response_like
127.0.0.1 TLSv1.3   TLS_AES_256_GCM_SHA384  RSA-SHA256 RSA2048  0 via proxy protocol v2 IPv4
--- no_error_log
[error]
