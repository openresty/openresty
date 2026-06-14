#!/usr/bin/env bash

set -euxo pipefail

mkdir -p download-cache

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    axel \
    build-essential \
    ca-certificates \
    cpanminus \
    dos2unix \
    git \
    libgd-dev \
    libpcre3 \
    libpcre3-dev \
    libpq-dev \
    mercurial \
    patch \
    perl \
    wget

cpanm --sudo --notest Test2::Suite Test::Nginx IPC::Run3 IPC::Run

rm -rf test-nginx
git clone --depth 1 https://github.com/openresty/test-nginx.git

if [ ! -f "download-cache/pcre2-$PCRE_VER.tar.gz" ]; then
    wget -P download-cache "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${PCRE_VER}/pcre2-${PCRE_VER}.tar.gz"
fi

rm -rf "pcre2-$PCRE_VER"
tar zxf "download-cache/pcre2-$PCRE_VER.tar.gz"
cd "pcre2-$PCRE_VER"
./configure --prefix="$PCRE_PREFIX" --enable-jit --enable-utf --enable-unicode-properties
make "-j$JOBS"
sudo env PATH="$PATH" make install
cd ..

if [ ! -f "download-cache/openssl-$OPENSSL_VER.tar.gz" ]; then
    wget -P download-cache "https://github.com/openssl/openssl/releases/download/openssl-${OPENSSL_VER}/openssl-${OPENSSL_VER}.tar.gz"
fi

rm -rf "openssl-$OPENSSL_VER"
tar zxf "download-cache/openssl-$OPENSSL_VER.tar.gz"
cd "openssl-$OPENSSL_VER"
patch -p1 < "../patches/openssl-$OPENSSL_PATCH_VER-sess_set_get_cb_yield.patch"
./config no-threads shared enable-ssl3 enable-ssl3-method -g --libdir=lib --prefix="$OPENSSL_PREFIX" -DPURIFY
make "-j$JOBS"
sudo make PATH="$PATH" install_sw
cd ..

sudo ln -sf /usr/bin/make /usr/bin/gmake

util/mirror-tarballs
cd "openresty-$(./util/ver)"
./configure \
    --with-http_v3_module \
    --with-stream_realip_module \
    --with-http_realip_module \
    --prefix="$OPENRESTY_PREFIX" \
    --with-cc-opt="-I$PCRE_INC -I$OPENSSL_INC" \
    --with-ld-opt="-L$PCRE_LIB -L$OPENSSL_LIB -Wl,-rpath,$PCRE_LIB:$OPENSSL_LIB" \
    --with-pcre-jit \
    --with-http_ssl_module \
    --with-debug \
    "-j$JOBS"
make "-j$JOBS"
sudo make install
cd ..

export PATH="$OPENRESTY_PREFIX/bin:$OPENRESTY_PREFIX/nginx/sbin:$PATH"
nginx -V
ldd "$(command -v nginx)" | grep -E 'luajit|ssl|pcre'
prove -Itest-nginx/inc -Itest-nginx/lib -I. -r t/
