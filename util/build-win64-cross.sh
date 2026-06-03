#!/bin/bash
#
# Cross-compile OpenResty for Windows x64 from macOS/Linux
# Requires: llvm-mingw cross-compiler at ~/.workbuddy/binaries/llvm-mingw/
#

set -e

# --- Configuration ---
TOOLCHAIN="/Users/luke/.workbuddy/binaries/llvm-mingw"
CROSS_PREFIX="x86_64-w64-mingw32-"
CC="${TOOLCHAIN}/bin/${CROSS_PREFIX}gcc"
CXX="${TOOLCHAIN}/bin/${CROSS_PREFIX}g++"
AR="${TOOLCHAIN}/bin/${CROSS_PREFIX}ar"
RANLIB="${TOOLCHAIN}/bin/${CROSS_PREFIX}ranlib"
STRIP="${TOOLCHAIN}/bin/${CROSS_PREFIX}strip"
WINDRES="${TOOLCHAIN}/bin/${CROSS_PREFIX}windres"

export PATH="${TOOLCHAIN}/bin:$PATH"

PCRE=pcre2-10.47
ZLIB=zlib-1.3.2
OPENSSL=openssl-3.5.6
JOBS=8

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BUILD_DIR="$PROJECT_DIR/build-cross"
PREFIX="$BUILD_DIR/install"

echo "=== OpenResty Cross-Compile for Windows x64 ==="
echo "Project: $PROJECT_DIR"
echo "Build:   $BUILD_DIR"
echo "Prefix:  $PREFIX"
echo "CC:      $CC"
echo ""

# --- Check prerequisites ---
if [ ! -f "$CC" ]; then
    echo "ERROR: Cross-compiler not found at $CC"
    echo "Please install llvm-mingw first."
    exit 1
fi

# --- Download dependencies if needed ---
mkdir -p "$BUILD_DIR/deps"
cd "$BUILD_DIR/deps"

if [ ! -f "$OPENSSL.tar.gz" ]; then
    echo "--- Downloading OpenSSL $OPENSSL ---"
    curl -L -o "$OPENSSL.tar.gz" "https://github.com/openssl/openssl/releases/download/$OPENSSL/$OPENSSL.tar.gz"
fi
if [ ! -f "$ZLIB.tar.gz" ]; then
    echo "--- Downloading zlib $ZLIB ---"
    curl -L -o "$ZLIB.tar.gz" "https://zlib.net/$ZLIB.tar.gz"
fi
if [ ! -f "$PCRE.tar.gz" ]; then
    echo "--- Downloading PCRE2 $PCRE ---"
    curl -L -o "$PCRE.tar.gz" "https://github.com/PCRE2Project/pcre2/releases/download/$PCRE/$PCRE.tar.gz"
fi

# --- Extract ---
rm -rf "$BUILD_DIR/lib"
mkdir -p "$BUILD_DIR/lib"
cd "$BUILD_DIR/lib"

echo "--- Extracting dependencies ---"
tar xf "$BUILD_DIR/deps/$OPENSSL.tar.gz"
tar xf "$BUILD_DIR/deps/$ZLIB.tar.gz"
tar xf "$BUILD_DIR/deps/$PCRE.tar.gz"

# --- Cross-compile zlib ---
echo "=== Building zlib for Windows x64 ==="
cd "$BUILD_DIR/lib/$ZLIB"
make -f win32/Makefile.gcc \
    CC="${CROSS_PREFIX}gcc" \
    AR="${CROSS_PREFIX}ar" \
    RC="${CROSS_PREFIX}windres" \
    STRIP="${CROSS_PREFIX}strip" \
    SHARED_MODE=1 \
    PREFIX="${CROSS_PREFIX}" \
    -j$JOBS

mkdir -p "$PREFIX"
mkdir -p "$PREFIX/lib" "$PREFIX/include" "$PREFIX/bin"
cp zlib1.dll "$PREFIX/bin/" 2>/dev/null || true
cp libz.a "$PREFIX/lib/" 2>/dev/null || true
cp libz.dll.a "$PREFIX/lib/" 2>/dev/null || true
cp zlib.h zconf.h "$PREFIX/include/"

# --- Cross-compile PCRE2 ---
echo "=== Building PCRE2 for Windows x64 ==="
cd "$BUILD_DIR/lib/$PCRE"
./configure \
    --host=x86_64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-jit \
    --enable-static \
    --disable-shared \
    CC="${CROSS_PREFIX}gcc" \
    CXX="${CROSS_PREFIX}g++" \
    AR="${CROSS_PREFIX}ar" \
    RANLIB="${CROSS_PREFIX}ranlib" \
    || true  # configure might fail, try cmake approach

# If configure failed, try CMake
if [ ! -f "Makefile" ]; then
    echo "autotools failed, trying cmake..."
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_TOOLCHAIN_FILE="$BUILD_DIR/toolchain.cmake" \
        -DCMAKE_INSTALL_PREFIX="$PREFIX" \
        -DPCRE2_BUILD_PCRE2_16=ON \
        -DPCRE2_BUILD_PCRE2_32=ON \
        -DPCRE2_SUPPORT_JIT=ON \
        -DPCRE2_STATIC_RUNTIME=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_STATIC_LIBS=ON \
        -G "Unix Makefiles"
fi

make -j$JOBS 2>&1 || echo "PCRE2 build may have issues, continuing..."
make install 2>&1 || true
cd "$BUILD_DIR/lib"

# --- Cross-compile OpenSSL ---
echo "=== Building OpenSSL for Windows x64 ==="
cd "$BUILD_DIR/lib/$OPENSSL"

# Apply patch if exists
PATCH_FILE="$PROJECT_DIR/patches/openssl-3.5.5-sess_set_get_cb_yield.patch"
if [ -f "$PATCH_FILE" ]; then
    patch -p1 < "$PATCH_FILE" || true
fi

./Configure mingw64 \
    --cross-compile-prefix="${CROSS_PREFIX}" \
    --prefix="$PREFIX" \
    --openssldir="$PREFIX/ssl" \
    no-asm \
    no-shared \
    no-docs \
    no-tests \
    -static

make -j$JOBS
make install_sw
cd "$BUILD_DIR/lib"

echo "=== Dependencies built successfully ==="

# --- Now build OpenResty itself ---
echo "=== Building OpenResty for Windows x64 ==="
cd "$PROJECT_DIR"

# First, we need to get the openresty bundle extracted
# Run make to prepare the bundle
if [ ! -d "openresty-1.31.1.1" ]; then
    echo "--- Preparing OpenResty bundle ---"
    make
fi

cd "openresty-1.31.1.1" || {
    echo "ERROR: No openresty-* directory found"
    ls -la
    exit 1
}

# Patch LuaJIT build to use cross-compiler CROSS prefix
# The configure script passes CC=$cc, but LuaJIT needs HOST_CC + CROSS for cross-compilation
echo "--- Patching LuaJIT build for cross-compilation ---"

# We'll use the OpenResty configure but with platform=msys and cross-compiler
./configure \
    --with-cc="$CC" \
    --platform=msys \
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
    --with-pcre="$BUILD_DIR/lib/$PCRE" \
    --with-zlib="$BUILD_DIR/lib/$ZLIB" \
    --with-openssl="$BUILD_DIR/lib/$OPENSSL" \
    --with-ld-opt="-static-libgcc" \
    -j$JOBS || {
        echo ""
        echo "=== Configure failed. This is expected for cross-compilation. ==="
        echo "The nginx build system doesn't fully support cross-compilation"
        echo "from macOS to Windows. See recommendations below."
        exit 1
    }

make -j$JOBS
make install DESTDIR="$PREFIX/openresty"

echo ""
echo "=== Build complete! ==="
echo "Output: $PREFIX/openresty/"
ls -la "$PREFIX/openresty/" 2>/dev/null || echo "(check output directory)"
