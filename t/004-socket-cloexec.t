# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;
use File::Temp qw(tempdir);

if ($^O ne 'linux') {
    plan skip_all => 'requires Linux accept4 and FD_CLOEXEC';
}

my $dir = tempdir(CLEANUP => 1);
my $source = "$dir/no-accept4.c";
my $library = "$dir/no-accept4.so";

open my $out, '>', $source or die "Cannot write $source: $!";
print $out <<'C';
#define _GNU_SOURCE
#include <errno.h>
#include <sys/socket.h>

int
accept4(int fd, struct sockaddr *addr, socklen_t *len, int flags)
{
    errno = ENOSYS;
    return -1;
}
C
close $out or die "Cannot close $source: $!";

system('cc', '-shared', '-fPIC', '-o', $library, $source) == 0
    or die "Cannot build accept4 test shim";

local $ENV{TEST_NGINX_LD_PRELOAD} = $library
    . ($ENV{TEST_NGINX_LD_PRELOAD} ? ":$ENV{TEST_NGINX_LD_PRELOAD}" : '');

log_level('debug');
repeat_each(1);

plan tests => repeat_each() * blocks() * 4;

run_tests();

__DATA__

=== TEST 1: accepted sockets remain close-on-exec after accept4 fallback
--- config
    location /t {
        content_by_lua_block {
            local ffi = require "ffi"
            local bit = require "bit"

            ffi.cdef[[int fcntl(int fd, int cmd, ...);]]

            local sock, err = ngx.req.socket()
            if not sock then
                ngx.say("request socket: ", err)
                return
            end

            local fd, err = sock:getfd()
            if not fd then
                ngx.say("request fd: ", err)
                return
            end

            local flags = ffi.C.fcntl(fd, 1)
            if flags < 0 then
                ngx.say("fcntl failed: ", ffi.errno())
                return
            end

            ngx.say("FD_CLOEXEC: ", bit.band(flags, 1))
        }
    }
--- request
POST /t
hello
--- response_body
FD_CLOEXEC: 1
--- error_log
accept4() failed (38:
--- no_error_log
[error]
