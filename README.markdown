Name
====

ngx_openresty - Turning Nginx into a Full-Fledged Scriptable Web Platform

Table of Contents
=================

* [Name](#name)
* [Description](#description)
    * [For Users](#for-users)
    * [For Bundle Maintainers](#for-bundle-maintainers)
* [Mailing List](#mailing-list)
* [Report Bugs](#report-bugs)
* [Copyright & License](#copyright--license)

Description
===========

ngx_openresty is a full-fledged web application server by bundling the standard nginx core,
lots of 3rd-party nginx modules, as well as most of their external dependencies.

This bundle is maintained Yichun Zhang (agentzh).

Because most of the nginx modules are developed by the bundle maintainers, it can ensure
that all these modules are played well together.

The bundled software components are copyrighted by the respective copyright holders.

The homepage for this project is http://openresty.org.

For Users
---------

Visit http://openresty.org/#Download to download the latest bundle tarball, and
follow the installation instructions in the page http://openresty.org/#Installation.

For Bundle Maintainers
----------------------

The bundle's source is at the following git repository:

https://github.com/openresty/ngx_openresty

To reproduce the bundle tarball, just do

```bash
make
```

at the top of the bundle source tree.

Please note that you may need to install some extra dependencies, like `perl`, `dos2unix` and
the Perl CPAN mdoule `Markdown::Pod`. On Fedora 22, for example, installing the dependencies
is as simple as running the following commands:

```bash
sudo dnf install perl dos2unix
sudo cpan Markdown::Pod
```

[Back to TOC](#table-of-contents)

Mailing List
============

You're very welcome to join the English OpenResty mailing list hosted on Google Groups:

https://groups.google.com/group/openresty-en

The Chinese mailing list is here:

https://groups.google.com/group/openresty

[Back to TOC](#table-of-contents)

Report Bugs
===========

You're very welcome to report issues on GitHub:

https://github.com/agentzh/ngx_openresty/issues

[Back to TOC](#table-of-contents)

Copyright & License
===================

The bundle itself is licensed under the 2-clause BSD license.

Copyright (c) 2011-2015, Yichun "agentzh" Zhang (章亦春) <agentzh@gmail.com>, CloudFlare Inc.

This module is licensed under the terms of the BSD license.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[Back to TOC](#table-of-contents)

