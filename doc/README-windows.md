Name
====

README-windows - README for the official 32-bit and 64-bit Windows builds of OpenResty

Table of Contents
=================

* [Name](#name)
* [Description](#description)
* [Debugging](#debugging)
* [Caveats](#caveats)
* [TODO](#todo)
* [Details About The Building Process](#details-about-the-building-process)
* [Author](#author)
* [Copyright & License](#copyright--license)

Description
===========

The official binary Win32 and Win64 distributions of OpenResty can be downloaded from the following web page:

https://openresty.org/en/download.html

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

If you are using the MSYS2 bash instead of the `cmd.exe` console, then you should replace the `/fi` option
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

Again, you should use the form `-pid` and `-F` for the options if you are in an MSYS2 bash
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
work, including StrawberryPerl, ActivePerl, and MSYS2 perl.
recommended though).

Debugging
=========

Debug symbols are enabled even in release builds. So that when things go very wrong,
one can still debug things with tools like MSYS2 GDB.

Inclusion of debug symbols make the binary files (`.exe` and `.dll` files) much larger,
but it generally will not load into memory during normal execution on a modern operating
system.

Caveats
=======

The Win32/Win64 port of the NGINX core supports the good old `select` IO multiplexing mechanism
only.
The I/O Completion Ports (IOCP) feature is *not* supported (yet). So do not use this build
for production environments with very high concurrency levels.

This Win32/Win64 build of OpenResty is mainly for developers who want to develop their applications
in native Windows environment (though they eventually push the finished work onto a Linux or *BSD box, most of the time).

[Back to TOC](#table-of-contents)

TODO
====

* Add support for more than one NGINX worker processes.
* Add support for concurrent connections more than 1024.
* Switch to the Microsoft Visual Studio compiler toolchain for better performance and easier binary
package redistribution.
* Bundle StrawberryPerl to make command-line utilities like `resty` work out of the box (without
manually installing a Perl).
* Deliver an alternative Win32/Win64 binary package built with best debugging capabilities (like enabling
NGINX debugging logs, disabling C compiler optimizations, and enabling all the assertions and checks).

[Back to TOC](#table-of-contents)

Details About The Building Process
==================================

If you want to build OpenResty on native Windows, the maintainers use the MSYS2 + MinGW
toolchain (run from the "MSYS2 MINGW64" shortcut). Below is a concise, practical
workflow using MSYS2 (follow the steps in order):

1. Install MSYS2

   - Install from https://www.msys2.org/ and then open the "MSYS2 MINGW64" shortcut
     (do not use the "MSYS2 MSYS" shortcut).

2. Install the toolchain and dependencies

```bash
pacman -Syu                              # initial update (may require reopening the shell)
pacman -S mingw-w64-x86_64-toolchain     # MinGW gcc / binutils for build outputs
pacman -S base-devel                     # MSYS build tools: make, patch, etc.
pacman -S perl make vim                  # ensure /usr/bin/perl and /usr/bin/make are available
```

3. Prepare source and dependencies

```bash
cd ~
curl -LO https://openresty.org/download/openresty-<version>.tar.gz
tar zxf openresty-<version>.tar.gz
cd openresty-<version>
```

4. Verify the environment

```bash
echo $MSYSTEM             # should output: MINGW64
gcc -dumpmachine          # should output: x86_64-w64-mingw32
perl -e 'print "$^O\n"'   # should output: cygwin or msys
make --version            # should output GNU Make x.x
```

All four checks should pass before continuing. If any check fails, fix the environment first
(ensure you are using the MSYS2 MINGW64 shell and that /mingw64/bin appears before other tool
locations in PATH).

5. Build

In the OpenResty source directory, the maintainers provide a helper script for the common
build steps:

```bash
./util/build-win32.sh
```

This script automatically downloads and extracts required dependencies (OpenSSL, zlib, PCRE2,
etc.), then runs `./configure`, `make`, and `make install` to produce `nginx.exe`.

Notes
-----
- If you need to customize compile options (for example, change parallel job counts or
  dependency versions), edit the variables in `util/build-win32.sh`: `PCRE`, `ZLIB`, `OPENSSL`,
  and `JOBS`.
- In the MSYS2 MINGW64 shell, `gcc` normally points to the MinGW-w64 compiler; do not build
  in the MSYS (non-MINGW) shell.
- If OpenSSL or other dependencies require additional patches, the patch files are located in
  the `patches/` directory and the script will apply them automatically.

Usually you can just download the official binary distribution instead of building locally.

[Back to TOC](#table-of-contents)

Author
======

Yichun "agentzh" Zhang <agentzh@gmail.com>, OpenResty Inc.

[Back to TOC](#table-of-contents)

Copyright & License
===================

This module is licensed under the BSD license.

Copyright (C) 2015-2019, by Yichun "agentzh" Zhang (章亦春) <agentzh@gmail.com>, OpenResty Inc.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[Back to TOC](#table-of-contents)

