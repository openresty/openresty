#!/bin/bash

PCRE=pcre2-10.47
ZLIB=zlib-1.3.2
OPENSSL=openssl-3.5.5
JOBS=12

# 下载函数：用 curl 替代 wget，支持重试和重定向
download() {
    local url="$1"
    local out="$2"
    curl -fL --retry 5 -C - -o "$out" "$url" 2>&1
}

if [ ! -f ../$OPENSSL.tar.gz ]; then
    echo "==> Downloading $OPENSSL..."
    download "https://github.com/openssl/openssl/releases/download/$OPENSSL/$OPENSSL.tar.gz" ../$OPENSSL.tar.gz
fi
if [ ! -f ../$ZLIB.tar.gz ]; then
    echo "==> Downloading $ZLIB..."
    download "https://github.com/madler/zlib/releases/download/v1.3.2/$ZLIB.tar.gz" ../$ZLIB.tar.gz
fi
if [ ! -f ../$PCRE.tar.gz ]; then
    echo "==> Downloading $PCRE..."
    download "https://github.com/PCRE2Project/pcre2/releases/download/$PCRE/$PCRE.tar.gz" ../$PCRE.tar.gz
fi

# 验证下载文件完整性
for f in ../$OPENSSL.tar.gz ../$ZLIB.tar.gz ../$PCRE.tar.gz; do
    if [ ! -f "$f" ]; then
        echo "ERROR: $f not found!"
        exit 1
    fi
    # 用 tar -tf 验证 gzip/tar 完整性（只列出内容不解压）
    if ! gzip -t "$f" 2>/dev/null; then
        echo "ERROR: $f is corrupted (gzip check failed), removing and retrying..."
        rm -f "$f"
        exit 1
    fi
    echo "OK: $f passed integrity check"
done

rm -rf objs || exit 1
mkdir -p objs/lib || exit 1
cd objs/lib || exit 1
echo "==> Extracting archives..."
tar -xf ../../../$OPENSSL.tar.gz || exit 1
tar -xf ../../../$ZLIB.tar.gz || exit 1
tar -xf ../../../$PCRE.tar.gz || exit 1
cd ../..

cd objs/lib/$OPENSSL || exit 1
patch -p1 < ../../../patches/openssl-3.5.5-sess_set_get_cb_yield.patch || exit 1
cd ../../..

# Patch nginx's auto/lib/openssl/make to force mingw64 target.
# This script runs from inside openresty-1.31.1.1/ (CI working-directory),
# and bundle/ is populated by the "Prepare bundle" step (Makefile downloads
# nginx tarball and extracts it under bundle/).
# We patch here instead of in the repo because .gitignore has openresty-*
# which blocks committing any files under the openresty source tree.
echo "==> Patching nginx auto/lib/openssl/make for mingw64 target..."
NGINX_MAKE="bundle/nginx-1.31.1/auto/lib/openssl/make"
if [ ! -f "$NGINX_MAKE" ]; then
    # Fallback: try absolute path relative to repo root
    REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
    NGINX_MAKE="$REPO_ROOT/openresty-1.31.1.1/bundle/nginx-1.31.1/auto/lib/openssl/make"
fi
if [ -f "$NGINX_MAKE" ]; then
    # Replace ./config with ./Configure and force mingw64 target
    sed -i 's|OPENSSL_CONFIG_CMD="\./config"|OPENSSL_CONFIG_CMD="./Configure"|' "$NGINX_MAKE"
    sed -i 's|OPENSSL_CONFIG_OPTS=""|OPENSSL_CONFIG_OPTS="mingw64"|' "$NGINX_MAKE"
    grep -q 'Configure.*mingw64' "$NGINX_MAKE" \
        && echo "OK: $NGINX_MAKE patched for mingw64" \
        || { echo "ERROR: failed to patch $NGINX_MAKE"; exit 1; }
else
    echo "ERROR: cannot find nginx auto/lib/openssl/make at $NGINX_MAKE"
    echo "Ensure 'make' (Prepare bundle step) has been run first."
    exit 1
fi

# Use MSYS2 perl instead of MinGW perl for configure (returns $^O='msys', not 'MSWin32')
# Export MSYSTEM to ensure the msys detection in nginx configure works properly
export MSYSTEM=MINGW64
PATH="/usr/bin:$PATH" ./configure \
    --with-cc=gcc \
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

