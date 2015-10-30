#!/bin/bash

rm -rf objs || exit 1
mkdir -p objs/lib || exit 1
cd objs/lib || exit 1
ls ../../..
tar -xf ../../../openssl-1.0.2d.tar.gz
tar -xf ../../../zlib-1.2.8.tar.gz
tar -xf ../../../pcre-8.37.tar.gz
cd ../..

    #--with-openssl-opt="no-asm" \

./configure --with-cc=gcc --with-ipv6 --prefix= \
    --with-cc-opt='-DFD_SETSIZE=1024' \
    --sbin-path=nginx.exe \
    --with-ipv6 \
    --with-pcre-jit \
    --with-luajit-xcflags="-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT" \
    --with-pcre=objs/lib/pcre-8.37 \
    --with-zlib=objs/lib/zlib-1.2.8 \
    --with-openssl=objs/lib/openssl-1.0.2d \
    --with-select_module -j5 || exit 1
#gmake -j5
make || exit 1
make install
