#!/bin/bash

PCRE=pcre-8.42
ZLIB=zlib-1.2.11
OPENSSL=openssl-1.1.0h
JOBS=12

# wget https://www.openssl.org/source/openssl-1.1.0h.tar.gz
# wget http://zlib.net/zlib-1.2.11.tar.gz
# wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz

rm -rf objs || exit 1
mkdir -p objs/lib || exit 1
cd objs/lib || exit 1
ls ../../..
tar -xf ../../../$OPENSSL.tar.gz || exit 1
tar -xf ../../../$ZLIB.tar.gz || exit 1
tar -xf ../../../$PCRE.tar.gz || exit 1
cd ../..

cd objs/lib/$OPENSSL || exit 1
patch -p1 < ../../../patches/openssl-1.1.0d-sess_set_get_cb_yield.patch \
    || exit 1
cd ../../..

    #--with-openssl-opt="no-asm" \

./configure \
    --with-cc=gcc \
    --with-ipv6 \
    --prefix= \
    --with-cc-opt='-DFD_SETSIZE=1024' \
    --sbin-path=nginx.exe \
    --with-pcre-jit \
    --without-http_rds_json_module \
    --without-http_rds_csv_module \
    --without-lua_rds_parser \
    --with-ipv6 \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-http_v2_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_secure_link_module \
    --with-http_random_index_module \
    --with-http_gzip_static_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-select_module \
    --with-luajit-xcflags="-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT" \
    --with-pcre=objs/lib/$PCRE \
    --with-zlib=objs/lib/$ZLIB \
    --with-openssl=objs/lib/$OPENSSL \
    -j$JOBS || exit 1

make -j$JOBS || exit 1
exec make install
