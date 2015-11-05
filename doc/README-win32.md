Name
====

README-win32 - README for the Windows 32-bit build of OpenResty

Description
===========

The binary distributions of OpenResty can be downloaded from the following web page:

https://openresty.org/#Download

To start the NGINX server of the nginx server of the Win32 binary distribution of OpenResty:

```bash
start nginx
```

You can also specify the `-p PATH/` option to override the default server prefix, as in

```bash
cd /path/to/my/openresty/app/
start nginx -p $PWD
```

Then you can use the `tasklist` command to check the nginx processes running in the background:

```console
C:\> tasklist /fi "imagename eq nginx.exe"

Image Name                     PID Session Name        Session#    Mem Usage
========================= ======== ================ =========== ============
nginx.exe                     4616 Console                    1      7,412 K
nginx.exe                     5836 Console                    1      7,800 K

```

One of the two processes is the master process while the other is the worker.

If you are using the MSYS bash instead of the `cmd.exe` console, then you should replace the `/fi` option
with `-fi` in the command above instead.

You can quickly shut down the server like this:

```bash
nginx -s stop
```

or gracefully shut it down like this:

```bash
nginx -s quit
```

You can also forcibly kill the nginx processes via their PIDs with `taskkill`, as in

```console
C:\> taskkill /pid 5488 /F
```

where the PID (5488 in this example) can be found via the aforementioned `tasklist` command.

Again, you should use the form `-pid` and `-F` for the options if you are in an MSYS bash
session.

Similarly, you can use the `nginx -s reload` command to reload nginx configurations without
stopping the server. And you can use `nginx -s reopen` to instruct nginx to re-open
all the log files.

You can run the `resty` script like this:

```console
C:\> resty -e "ngx.say('Hello, OpenResty!')"
Hello, OpenResty!
```

The `resty` command-line utility requires a Perl interpreter installed in your
system and visible to your PATH environment. Any perl distributions should
work, including StrawberryPerl, ActivePerl, and MSYS perl (the former two are
recommended though).

Debugging
=========

Debug symbosl are enabled even in release builds. So that when things go very wrong,
one can still debug things with tools like MSYS GDB.

Inclusion of debug symbols make the binary files (`.exe` and `.dll` files) much larger,
but it generally will not load into memory during normal execution on a modern operating
system.

Caveats
=======

The Win32 port of the NGINX core supports the good old `select` IO multiplexing mechanism
only.
The I/O Completion Ports (IOCP) feature is *not* supported (yet). So do not use this build
for production environments with very high concurrency levels.

This Win32 build of OpenResty is mainly for developers who want to develop their applications
in native Windows environment (though they eventually push the finished work onto a Linux or *BSD box, most of the time).

TODO
====

* Add support for more than one NGINX worker processes.
* Add support for concurrent connections more than 1024.
* Switch to the Microsoft Visual Studio compiler toolchain for better performance and easier binary
package redistribution.
* Bundle StrawberryPerl to make command-line utilities like `resty` work out of the box (without
manually installing a Perl).
* Deliver an alternative Win32 binary package built with best debuggin capabilities (like enabling
NGINX debugging logs, disabling C compiler optimizations, and enabling all the assertions and checks).
* Deliver binary packages for 64-bit Windows (Win64).

Details About The Building Process
==================================

Usually you do not need to worry about how the Win32 binaries were built on the maintainers''
side. But if you do, please read on.

The Win32 build of OpenResty is currently built via the MinGW/MSYS toolchain, including
MinGW gcc 4.8.1, MSYS perl, MSYS bash, MSYS make, and etc. Basically, it is currently built via
 the following cmmands:

```bash
mkdir -p objs/lib || exit 1
cd objs/lib || exit 1
ls ../../..
tar -xf ../../../openssl-1.0.2d.tar.gz
tar -xf ../../../zlib-1.2.8.tar.gz
tar -xf ../../../pcre-8.37.tar.gz
cd ../..
./configure --with-cc=gcc \
    --prefix= \
    --with-cc-opt='-DFD_SETSIZE=1024' \
    --with-select_module \
    --with-ipv6 \
    --sbin-path=nginx.exe \
    --with-pcre-jit \
    --with-luajit-xcflags="-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT" \
    --with-pcre=objs/lib/pcre-8.37 \
    --with-zlib=objs/lib/zlib-1.2.8 \
    --with-openssl=objs/lib/openssl-1.0.2d \
    -j5
make
make install
```

where the dependency library source tarballs for OpenSSL, Zlib, and PCRE are downloaded
from their official sites, respectively.

We automate these commands in a dedicated shell script named [build-win32.sh](https://github.com/openresty/ngx_openresty/blob/master/util/build-win32.sh).

Furthermore, we automate the packaging process of the resulting binaries and supporting files
with this [package-win32.sh](https://github.com/openresty/ngx_openresty/blob/master/util/package-win32.sh)
script.

Usually you can just download and use the binary distribution of OpenResty without
installing the build toolchain.

Author
======

Yichun "agentzh" Zhang <agentzh@gmail.com>, CloudFlare Inc.

Copyright & License
===================

This module is licensed under the BSD license.

Copyright (C) 2015, by Yichun "agentzh" Zhang (章亦春) <agentzh@gmail.com>, CloudFlare Inc.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
