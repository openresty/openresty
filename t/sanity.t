# vi:ft=

use t::Config;

plan tests => 231;

#no_diff();

run_tests();

__DATA__

=== TEST 1: --help
--- cmd: ./configure --help
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix (default to /usr/local/openresty)

  --with-debug                       enable debug logging
  --with-dtrace-probes               enable dtrace USDT probes
  --with-dtrace=PATH                 set dtrace utility pathname

  --with-no-pool-patch               enable the no-pool patch for debugging memory issues

  -jN                                pass -jN option to make while building the bundled
                                     Lua 5.1 interpreter or LuaJIT 2.1

  --without-http_echo_module         disable ngx_http_echo_module
  --without-http_xss_module          disable ngx_http_xss_module
  --without-http_coolkit_module      disable ngx_http_coolkit_module
  --without-http_set_misc_module     disable ngx_http_set_misc_module
  --without-http_form_input_module   disable ngx_http_form_input_module
  --without-http_encrypted_session_module
                                     disable ngx_http_encrypted_session_module
  --without-http_srcache_module      disable ngx_http_srcache_module
  --without-http_lua_module          disable ngx_http_lua_module
  --without-http_lua_upstream_module disable ngx_http_lua_upstream_module
  --without-http_headers_more_module disable ngx_http_headers_more_module
  --without-http_array_var_module    disable ngx_http_array_var_module
  --without-http_memc_module         disable ngx_http_memc_module
  --without-http_redis2_module       disable ngx_http_redis2_module
  --without-http_redis_module        disable ngx_http_redis_module
  --without-http_rds_json_module     disable ngx_http_rds_json_module
  --without-http_rds_csv_module      disable ngx_http_rds_csv_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-http_ssl_module          disable ngx_http_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_drizzle_module         enable ngx_http_drizzle_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua_cjson                disable the lua-cjson library
  --without-lua_redis_parser         disable the lua-redis-parser library
  --without-lua_rds_parser           disable the lua-rds-parser library
  --without-lua_resty_dns            disable the lua-resty-dns library
  --without-lua_resty_memcached      disable the lua-resty-memcached library
  --without-lua_resty_redis          disable the lua-resty-redis library
  --without-lua_resty_mysql          disable the lua-resty-mysql library
  --without-lua_resty_upload         disable the lua-resty-upload library
  --without-lua_resty_upstream_healthcheck
                                     disable the lua-resty-upstream-healthcheck library
  --without-lua_resty_string         disable the lua-resty-string library
  --without-lua_resty_websocket      disable the lua-resty-websocket library
  --without-lua_resty_lock           disable the lua-resty-lock library
  --without-lua_resty_lrucache       disable the lua-resty-lrucache library
  --without-lua_resty_core           disable the lua-resty-core library

  --with-lua51                       enable and build the bundled standard Lua 5.1 interpreter
  --without-lua51                    disable the bundled standard Lua 5.1 interpreter
  --with-lua51=DIR                   specify the external installation of Lua 5.1 by DIR
  --with-luajit                      enable and build the bundled LuaJIT 2.1 (the default)
  --with-luajit=DIR                  use the external LuaJIT 2.1 installation specified by DIR
  --with-luajit-xcflags=FLAGS        Specify extra C compiler flags for LuaJIT 2.1
  --with-libdrizzle=DIR              specify the libdrizzle 1.0 (or drizzle) installation prefix
  --with-libpq=DIR                   specify the libpq (or postgresql) installation prefix
  --with-pg_config=PATH              specify the path of the pg_config utility

Options directly inherited from nginx

  --sbin-path=PATH                   set nginx binary pathname
  --conf-path=PATH                   set nginx.conf pathname
  --error-log-path=PATH              set error log pathname
  --pid-path=PATH                    set nginx.pid pathname
  --lock-path=PATH                   set nginx.lock pathname
  --tapset-prefix=PATH               set systemtap tapset directory prefix
  --stap-nginx-path=PATH             set stap-nginx pathname

  --user=USER                        set non-privileged user for
                                     worker processes
  --group=GROUP                      set non-privileged group for
                                     worker processes

  --builddir=DIR                     set the build directory

  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

  --with-threads                     enable thread pool support

  --with-file-aio                    enable file aio support
  --with-ipv6                        enable ipv6 support

  --with-http_realip_module          enable ngx_http_realip_module
  --with-http_addition_module        enable ngx_http_addition_module
  --with-http_xslt_module            enable ngx_http_xslt_module
  --with-http_image_filter_module    enable ngx_http_image_filter_module
  --with-http_geoip_module           enable ngx_http_geoip_module
  --with-http_sub_module             enable ngx_http_sub_module
  --with-http_dav_module             enable ngx_http_dav_module
  --with-http_flv_module             enable ngx_http_flv_module
  --with-http_gzip_static_module     enable ngx_http_gzip_static_module
  --with-http_auth_request_module    enable ngx_http_auth_request_module
  --with-http_random_index_module    enable ngx_http_random_index_module
  --with-http_secure_link_module     enable ngx_http_secure_link_module
  --with-http_degradation_module     enable ngx_http_degradation_module
  --with-http_stub_status_module     enable ngx_http_stub_status_module

  --without-http_charset_module      disable ngx_http_charset_module
  --without-http_gzip_module         disable ngx_http_gzip_module
  --without-http_ssi_module          disable ngx_http_ssi_module
  --without-http_userid_module       disable ngx_http_userid_module
  --without-http_access_module       disable ngx_http_access_module
  --without-http_auth_basic_module   disable ngx_http_auth_basic_module
  --without-http_autoindex_module    disable ngx_http_autoindex_module
  --without-http_geo_module          disable ngx_http_geo_module
  --without-http_map_module          disable ngx_http_map_module
  --without-http_split_clients_module disable ngx_http_split_clients_module
  --without-http_referer_module      disable ngx_http_referer_module
  --without-http_rewrite_module      disable ngx_http_rewrite_module
  --without-http_proxy_module        disable ngx_http_proxy_module
  --without-http_fastcgi_module      disable ngx_http_fastcgi_module
  --without-http_uwsgi_module        disable ngx_http_uwsgi_module
  --without-http_scgi_module         disable ngx_http_scgi_module
  --without-http_memcached_module    disable ngx_http_memcached_module
  --without-http_limit_conn_module   disable ngx_http_limit_conn_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module
  --without-http_upstream_least_conn_module
                                     disable ngx_http_upstream_least_conn_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module

  --with-http_perl_module            enable ngx_http_perl_module
  --with-perl_modules_path=PATH      set path to the perl modules
  --with-perl=PATH                   set path to the perl binary

  --http-log-path=PATH               set path to the http access log
  --http-client-body-temp-path=PATH  set path to the http client request body
                                     temporary files
  --http-proxy-temp-path=PATH        set path to the http proxy temporary files
  --http-fastcgi-temp-path=PATH      set path to the http fastcgi temporary
                                     files
  --http-uwsgi-temp-path=PATH        set path to the http uwsgi temporary files
  --http-scgi-temp-path=PATH         set path to the http scgi temporary files

  --without-http                     disable HTTP server
  --without-http-cache               disable HTTP cache

  --with-mail                        enable POP3/IMAP4/SMTP proxy module
  --with-mail_ssl_module             enable ngx_mail_ssl_module
  --without-mail_pop3_module         disable ngx_mail_pop3_module
  --without-mail_imap_module         disable ngx_mail_imap_module
  --without-mail_smtp_module         disable ngx_mail_smtp_module

  --with-google_perftools_module     enable ngx_google_perftools_module
  --with-cpp_test_module             enable ngx_cpp_test_module

  --add-module=PATH                  enable an external module

  --with-cc=PATH                     set path to C compiler
  --with-cpp=PATH                    set path to C preprocessor
  --with-cc-opt=OPTIONS              set additional options for C compiler
  --with-ld-opt=OPTIONS              set additional options for linker
  --with-cpu-opt=CPU                 build for specified CPU, the valid values:
                                     pentium, pentiumpro, pentium3, pentium4,
                                     athlon, opteron, sparc32, sparc64, ppc64

  --with-make=PATH                   specify the default make utility to be used

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional make options for PCRE
  --with-pcre-conf-opt=OPTIONS       set additional configure options for PCRE
  --with-pcre-jit                    build PCRE with JIT compilation support

  --with-md5=DIR                     set path to md5 library sources
  --with-md5-opt=OPTIONS             set additional options for md5 building
  --with-md5-asm                     use md5 assembler sources

  --with-sha1=DIR                    set path to sha1 library sources
  --with-sha1-opt=OPTIONS            set additional options for sha1 building
  --with-sha1-asm                    use sha1 assembler sources

  --with-zlib=DIR                    set path to zlib library sources
  --with-zlib-opt=OPTIONS            set additional options for zlib building
  --with-zlib-asm=CPU                use zlib assembler sources optimized
                                     for specified CPU, the valid values:
                                     pentium, pentiumpro

  --with-libatomic                   force libatomic_ops library usage
  --with-libatomic=DIR               set path to libatomic_ops library sources

  --with-openssl=DIR                 set path to OpenSSL library sources
  --with-openssl-opt=OPTIONS         set additional options for OpenSSL building

  --dry-run                          dry running the configure, for testing only
  --platform=PLATFORM                forcibly specify a platform name, for testing only



=== TEST 2: lua 5.1
--- cmd: ./configure --with-lua51 --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 3: --with-debug (standard lua)
--- cmd: ./configure --with-lua51 --with-debug --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 4: --with-http_ssl_module & --without-http_ssl_module
--- cmd: ./configure --with-http_ssl_module --without-http_ssl_module
--- out
platform: linux (linux)

--- err
--with-http_ssl_module conflicts with --without-http_ssl_module.
--- exit: 2



=== TEST 5: default (on Linux)
--- cmd: ./configure --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 6: --with-luajit
--- cmd: ./configure --with-luajit --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 7: --with-cc-opt
--- cmd: ./configure --with-luajit --with-cc-opt="-O3" --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2 -O3' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 8: --with-ld-opt
--- cmd: ./configure --with-luajit --with-ld-opt="-llua" --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib -llua' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 9: --with-luajit & --without-http_lua_module
--- cmd: ./configure --with-luajit --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 10: --without-http_lua_module
--- cmd: ./configure --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 11: --prefix
--- cmd: ./configure --with-lua51 --prefix=/opt/blah --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//opt/blah/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/opt/blah/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_CMODULE_DIR=/opt/blah/lualib LUA_MODULE_DIR=/opt/blah/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_LIB_DIR=/opt/blah/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_LIB_DIR=/opt/blah/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/opt/blah/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_CMODULE_DIR=/opt/blah/lualib LUA_MODULE_DIR=/opt/blah/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_LIB_DIR=/opt/blah/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include LUA_LIB_DIR=/opt/blah/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/opt/blah/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/opt/blah/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 12: --help on solaris
--- cmd: ./configure --help --platform=solaris
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix (default to /usr/local/openresty)

  --with-debug                       enable debug logging
  --with-dtrace-probes               enable dtrace USDT probes
  --with-dtrace=PATH                 set dtrace utility pathname

  --with-no-pool-patch               enable the no-pool patch for debugging memory issues

  -jN                                pass -jN option to make while building the bundled
                                     Lua 5.1 interpreter or LuaJIT 2.1

  --without-http_echo_module         disable ngx_http_echo_module
  --without-http_xss_module          disable ngx_http_xss_module
  --without-http_coolkit_module      disable ngx_http_coolkit_module
  --without-http_set_misc_module     disable ngx_http_set_misc_module
  --without-http_form_input_module   disable ngx_http_form_input_module
  --without-http_encrypted_session_module
                                     disable ngx_http_encrypted_session_module
  --without-http_srcache_module      disable ngx_http_srcache_module
  --without-http_lua_module          disable ngx_http_lua_module
  --without-http_lua_upstream_module disable ngx_http_lua_upstream_module
  --without-http_headers_more_module disable ngx_http_headers_more_module
  --without-http_array_var_module    disable ngx_http_array_var_module
  --without-http_memc_module         disable ngx_http_memc_module
  --without-http_redis2_module       disable ngx_http_redis2_module
  --without-http_redis_module        disable ngx_http_redis_module
  --without-http_rds_json_module     disable ngx_http_rds_json_module
  --without-http_rds_csv_module      disable ngx_http_rds_csv_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-http_ssl_module          disable ngx_http_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_drizzle_module         enable ngx_http_drizzle_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua_cjson                disable the lua-cjson library
  --without-lua_redis_parser         disable the lua-redis-parser library
  --without-lua_rds_parser           disable the lua-rds-parser library
  --without-lua_resty_dns            disable the lua-resty-dns library
  --without-lua_resty_memcached      disable the lua-resty-memcached library
  --without-lua_resty_redis          disable the lua-resty-redis library
  --without-lua_resty_mysql          disable the lua-resty-mysql library
  --without-lua_resty_upload         disable the lua-resty-upload library
  --without-lua_resty_upstream_healthcheck
                                     disable the lua-resty-upstream-healthcheck library
  --without-lua_resty_string         disable the lua-resty-string library
  --without-lua_resty_websocket      disable the lua-resty-websocket library
  --without-lua_resty_lock           disable the lua-resty-lock library
  --without-lua_resty_lrucache       disable the lua-resty-lrucache library
  --without-lua_resty_core           disable the lua-resty-core library

  --with-lua51                       enable and build the bundled standard Lua 5.1 interpreter
  --without-lua51                    disable the bundled standard Lua 5.1 interpreter
  --with-lua51=DIR                   specify the external installation of Lua 5.1 by DIR
  --with-luajit                      enable and build the bundled LuaJIT 2.1 (the default)
  --with-luajit=DIR                  use the external LuaJIT 2.1 installation specified by DIR
  --with-luajit-xcflags=FLAGS        Specify extra C compiler flags for LuaJIT 2.1
  --with-libdrizzle=DIR              specify the libdrizzle 1.0 (or drizzle) installation prefix
  --with-libpq=DIR                   specify the libpq (or postgresql) installation prefix
  --with-pg_config=PATH              specify the path of the pg_config utility

Options directly inherited from nginx

  --sbin-path=PATH                   set nginx binary pathname
  --conf-path=PATH                   set nginx.conf pathname
  --error-log-path=PATH              set error log pathname
  --pid-path=PATH                    set nginx.pid pathname
  --lock-path=PATH                   set nginx.lock pathname
  --tapset-prefix=PATH               set systemtap tapset directory prefix
  --stap-nginx-path=PATH             set stap-nginx pathname

  --user=USER                        set non-privileged user for
                                     worker processes
  --group=GROUP                      set non-privileged group for
                                     worker processes

  --builddir=DIR                     set the build directory

  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

  --with-threads                     enable thread pool support

  --with-file-aio                    enable file aio support
  --with-ipv6                        enable ipv6 support

  --with-http_realip_module          enable ngx_http_realip_module
  --with-http_addition_module        enable ngx_http_addition_module
  --with-http_xslt_module            enable ngx_http_xslt_module
  --with-http_image_filter_module    enable ngx_http_image_filter_module
  --with-http_geoip_module           enable ngx_http_geoip_module
  --with-http_sub_module             enable ngx_http_sub_module
  --with-http_dav_module             enable ngx_http_dav_module
  --with-http_flv_module             enable ngx_http_flv_module
  --with-http_gzip_static_module     enable ngx_http_gzip_static_module
  --with-http_auth_request_module    enable ngx_http_auth_request_module
  --with-http_random_index_module    enable ngx_http_random_index_module
  --with-http_secure_link_module     enable ngx_http_secure_link_module
  --with-http_degradation_module     enable ngx_http_degradation_module
  --with-http_stub_status_module     enable ngx_http_stub_status_module

  --without-http_charset_module      disable ngx_http_charset_module
  --without-http_gzip_module         disable ngx_http_gzip_module
  --without-http_ssi_module          disable ngx_http_ssi_module
  --without-http_userid_module       disable ngx_http_userid_module
  --without-http_access_module       disable ngx_http_access_module
  --without-http_auth_basic_module   disable ngx_http_auth_basic_module
  --without-http_autoindex_module    disable ngx_http_autoindex_module
  --without-http_geo_module          disable ngx_http_geo_module
  --without-http_map_module          disable ngx_http_map_module
  --without-http_split_clients_module disable ngx_http_split_clients_module
  --without-http_referer_module      disable ngx_http_referer_module
  --without-http_rewrite_module      disable ngx_http_rewrite_module
  --without-http_proxy_module        disable ngx_http_proxy_module
  --without-http_fastcgi_module      disable ngx_http_fastcgi_module
  --without-http_uwsgi_module        disable ngx_http_uwsgi_module
  --without-http_scgi_module         disable ngx_http_scgi_module
  --without-http_memcached_module    disable ngx_http_memcached_module
  --without-http_limit_conn_module   disable ngx_http_limit_conn_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module
  --without-http_upstream_least_conn_module
                                     disable ngx_http_upstream_least_conn_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module

  --with-http_perl_module            enable ngx_http_perl_module
  --with-perl_modules_path=PATH      set path to the perl modules
  --with-perl=PATH                   set path to the perl binary

  --http-log-path=PATH               set path to the http access log
  --http-client-body-temp-path=PATH  set path to the http client request body
                                     temporary files
  --http-proxy-temp-path=PATH        set path to the http proxy temporary files
  --http-fastcgi-temp-path=PATH      set path to the http fastcgi temporary
                                     files
  --http-uwsgi-temp-path=PATH        set path to the http uwsgi temporary files
  --http-scgi-temp-path=PATH         set path to the http scgi temporary files

  --without-http                     disable HTTP server
  --without-http-cache               disable HTTP cache

  --with-mail                        enable POP3/IMAP4/SMTP proxy module
  --with-mail_ssl_module             enable ngx_mail_ssl_module
  --without-mail_pop3_module         disable ngx_mail_pop3_module
  --without-mail_imap_module         disable ngx_mail_imap_module
  --without-mail_smtp_module         disable ngx_mail_smtp_module

  --with-google_perftools_module     enable ngx_google_perftools_module
  --with-cpp_test_module             enable ngx_cpp_test_module

  --add-module=PATH                  enable an external module

  --with-cc=PATH                     set path to C compiler
  --with-cpp=PATH                    set path to C preprocessor
  --with-cc-opt=OPTIONS              set additional options for C compiler
  --with-ld-opt=OPTIONS              set additional options for linker
  --with-cpu-opt=CPU                 build for specified CPU, the valid values:
                                     pentium, pentiumpro, pentium3, pentium4,
                                     athlon, opteron, sparc32, sparc64, ppc64

  --with-make=PATH                   specify the default make utility to be used

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional make options for PCRE
  --with-pcre-conf-opt=OPTIONS       set additional configure options for PCRE
  --with-pcre-jit                    build PCRE with JIT compilation support

  --with-md5=DIR                     set path to md5 library sources
  --with-md5-opt=OPTIONS             set additional options for md5 building
  --with-md5-asm                     use md5 assembler sources

  --with-sha1=DIR                    set path to sha1 library sources
  --with-sha1-opt=OPTIONS            set additional options for sha1 building
  --with-sha1-asm                    use sha1 assembler sources

  --with-zlib=DIR                    set path to zlib library sources
  --with-zlib-opt=OPTIONS            set additional options for zlib building
  --with-zlib-asm=CPU                use zlib assembler sources optimized
                                     for specified CPU, the valid values:
                                     pentium, pentiumpro

  --with-libatomic                   force libatomic_ops library usage
  --with-libatomic=DIR               set path to libatomic_ops library sources

  --with-openssl=DIR                 set path to OpenSSL library sources
  --with-openssl-opt=OPTIONS         set additional options for OpenSSL building

  --dry-run                          dry running the configure, for testing only
  --platform=PLATFORM                forcibly specify a platform name, for testing only



=== TEST 13: std lua 5.1 interpreter on solaris
--- cmd: ./configure --with-lua51 --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake solaris
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) solaris
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 14: --with-http_drizzle_module on solaris
--- cmd: ./configure --with-lua51 --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake solaris
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../drizzle-nginx-module-0.1.9 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) solaris
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 15: --with-http_drizzle_module on Solaris
--- cmd: ./configure --with-lua51 --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake solaris
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../drizzle-nginx-module-0.1.9 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) solaris
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 16: ngx_drizzle not enabled but specify --with-libdrizzle
--- cmd: ./configure --with-libdrizzle=/opt/drizzle --dry-run
--- out
platform: linux (linux)

--- err
The http_drizzle_module is not enabled while --with-libdrizzle is specified.
--- exit: 2



=== TEST 17: ngx_drizzle enabled and --with-libdrizzle is specified
--- cmd: ./configure --with-lua51 --with-libdrizzle=/opt/drizzle --with-http_drizzle_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LIBDRIZZLE_LIB='/opt/drizzle/lib'
export LIBDRIZZLE_INC='/opt/drizzle/include/libdrizzle-1.0'
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../drizzle-nginx-module-0.1.9 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/opt/drizzle/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 18: --with-cc on Solaris
--- cmd: ./configure --with-lua51 --with-cc=gcc-4.2 --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake CC='gcc-4.2' solaris
gmake install CC='gcc-4.2' INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  '--with-cc=gcc-4.2' --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) CC='gcc-4.2' solaris
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install CC='gcc-4.2' INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 19: --with-debug & luajit
--- cmd: ./configure --with-luajit --with-debug --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 20: --with-debug & luajit & --with-cc=cl
--- cmd: ./configure --with-luajit --with-debug --dry-run --with-cc=cl
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  '--with-cc=cl' --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build
--- err
Can't exec "cl": No such file or directory at ./configure line 588.



=== TEST 21: ngx_postgres not enabled but specify --with-libpq
--- cmd: ./configure --with-libpq=/opt/postgres --dry-run
--- out
platform: linux (linux)

--- err
The http_postgres_module is not enabled while --with-libpq is specified.
--- exit: 2



=== TEST 22: ngx_postgres enabled and --with-libpq is specified
--- cmd: ./configure --with-lua51 --with-libpq=/opt/postgres --with-http_postgres_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LIBPQ_LIB='/opt/postgres/lib'
export LIBPQ_INC='/opt/postgres/include'
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../ngx_postgres-1.0rc7 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/opt/postgres/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 23: with iconv
--- cmd: ./configure --with-lua51 --with-http_iconv_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../iconv-nginx-module-0.13 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 24: --with-libpq & --with-pg_config
--- cmd: ./configure --with-libpq=/foo/bar --with-pg_config=/baz
--- out

--- err
--with-pg_config is not allowed when --with-libpq is already specified.
--- exit: 255



=== TEST 25: --with-pg_config & --with-libpq
--- cmd: ./configure --with-pg_config=/baz --with-libpq=/foo/bar
--- out

--- err
--with-libpq is not allowed when --with-pg_config is already specified.
--- exit: 2



=== TEST 26: ngx_postgres enabled and --with-pg_config is specified
--- cmd: ./configure --with-lua51 --with-pg_config=pg_config --with-http_postgres_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LIBPQ_LIB='/usr/lib64'
export LIBPQ_INC='/usr/include'
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../ngx_postgres-1.0rc7 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/lib64' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 27: ngx_postgres not enabled but specify --with-pg_config
--- cmd: ./configure --with-pg_config=pg_config --dry-run
--- out
platform: linux (linux)

--- err
The http_postgres_module is not enabled while --with-pg_config is specified.
--- exit: 2



=== TEST 28: --with-make option
--- cmd: ./configure --with-lua51 --with-make=make --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
make linux
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    make
    make install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 29: --with-luajit on Solaris
--- cmd: ./configure --with-luajit --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 30: default on Solaris
--- cmd: ./configure --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g INSTALL_X='$OPENRESTY_BUILD_DIR/install -m 0755' INSTALL_F='$OPENRESTY_BUILD_DIR/install -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 31: default on FreeBSD
--- cmd: ./configure --dry-run --platform=freebsd
--- out
platform: freebsd (freebsd)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 32: --with-luajit on FreeBSD
--- cmd: ./configure --with-luajit --dry-run --platform=freebsd
--- out
platform: freebsd (freebsd)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 33: lua51 on Mac OS X
--- cmd: ./configure --with-lua51 --dry-run --platform=darwin
--- out
platform: macosx (darwin)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake macosx
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) macosx
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 34: --with-luajit on Mac OS X
--- cmd: ./configure --dry-run --platform=darwin --with-luajit
--- out
platform: macosx (darwin)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 35: default on Mac OS X
--- cmd: ./configure --dry-run --platform=darwin
--- out
platform: macosx (darwin)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 36: --with-debug on solaris
--- cmd: ./configure --with-lua51 --dry-run --platform=solaris --with-debug
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake solaris
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) solaris
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 37: --without-lua_cjson
--- cmd: ./configure --with-lua51 --dry-run --without-lua_cjson
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 38: --without-lua_redis_parser & --without-lua_cjson
--- cmd: ./configure --with-lua51 --dry-run --without-lua_redis_parser --without-lua_cjson
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 39: disable rds-parser
--- cmd: ./configure --with-lua51 --dry-run --without-lua_rds_parser
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 40: --with-luajit=PATH
--- cmd: ./configure --with-luajit=/tmp/luajit --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LUAJIT_LIB='/tmp/luajit/lib'
export LUAJIT_INC='/tmp/luajit/include/luajit-2.1'
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/tmp/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 41: --with-luajit & --with-luajit=PATH
--- cmd: ./configure --with-luajit=/tmp/luajit --with-luajit
--- out
platform: linux (linux)

--- err
--with-luajit and --with-luajit=DIR are mutually exclusive.
--- exit: 2



=== TEST 42: --with-lua51=PATH
--- cmd: ./configure --dry-run --with-lua51=/tmp/lua
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LUA_LIB='/tmp/lua/lib'
export LUA_INC='/tmp/lua/include'
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/tmp/lua/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 43: ./configure with -jN
--- cmd: ./configure --with-lua51 --dry-run -j10
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake -j10 linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 44: --with-luajit & -jN
--- cmd: ./configure --with-luajit --dry-run -j5
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake -j5 TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 45: relative path as the --add-module option's value
--- cmd: ./configure --with-lua51 --add-module=/path/to/some/module --add-module=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --add-module=/path/to/some/module --add-module=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 46: relative path as the --with-openssl option's value
--- cmd: ./configure --with-lua51 --with-openssl=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-openssl=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 47: --without-lua_resty_memcached
--- cmd: ./configure --with-lua51 --dry-run --without-lua_resty_memcached
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 48: --without-lua_resty_redis
--- cmd: ./configure --with-lua51 --dry-run --without-lua_resty_redis
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 49: --with-luajit-xcflags
--- cmd: ./configure --with-luajit --with-luajit-xcflags='-DLUAJIT_USE_VALGRIND' --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 50: --with-debug & luajit & --with-luajit-xcflags
--- cmd: ./configure --with-luajit --with-debug --dry-run --with-luajit-xcflags='-DLUAJIT_USE_VALGRIND'
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_USE_VALGRIND -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_USE_VALGRIND -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_USE_VALGRIND -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_USE_VALGRIND -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 51: relative path as the --with-pcre option's value
--- cmd: ./configure --with-lua51 --with-pcre=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-pcre=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 52: relative path as the --with-zlib option's value
--- cmd: ./configure --with-lua51 --with-zlib=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-zlib=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 53: relative path as the --with-md5 option's value
--- cmd: ./configure --with-lua51 --with-md5=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-md5=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 54: relative path as the --with-sha1 option's value
--- cmd: ./configure --with-lua51 --with-sha1=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-sha1=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 55: relative path as the --with-libatomic option's value
--- cmd: ./configure --with-lua51 --with-libatomic=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-libatomic=$OPENRESTY_DIR/../some/module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 56: --without-lua_resty_dns
--- cmd: ./configure --with-lua51 --dry-run --without-lua_resty_dns
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root//usr/local/openresty/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)/usr/local/openresty/bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 57: --prefix (relative path: "."), lua51
--- cmd: ./configure --with-lua51 --prefix=. --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd lua-5.1.5
gmake linux
gmake install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/lua/
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/lua/include'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) linux
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/lua-5.1.5 && $(MAKE) install INSTALL_TOP=$(DESTDIR)./lua
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/lua-root/lua/include LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)./bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 58: --prefix (relative path: "."), luajit
--- cmd: ./configure --prefix=. --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)./bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 59: --prefix (relative path: ""), luajit
--- cmd: ./configure --prefix= --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-ld-opt='-Wl,-rpath,luajit/lib' \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)./bin/
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 60: MSYS platform
--- cmd: ./configure --prefix= --platform=msys --dry-run
--- out
platform: msys (msys)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20151028
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
install -m 0755 src/luajit.exe src/lua51.dll $OPENRESTY_BUILD_DIR/luajit-root/
mkdir -p $OPENRESTY_BUILD_DIR/luajit-root/lua/jit
install -m 0644 src/jit/*.lua $OPENRESTY_BUILD_DIR/luajit-root/lua/jit/
mkdir -p $OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1
cd src && install -m 0644 lua.h lualib.h lauxlib.h luaconf.h lua.hpp luajit.h $OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1'
cd ..
cd nginx-1.9.3
sh ./configure --prefix=. \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.2.19 \
  --add-module=../echo-nginx-module-0.58 \
  --add-module=../xss-nginx-module-0.05 \
  --add-module=../ngx_coolkit-0.2rc3 \
  --add-module=../set-misc-nginx-module-0.29 \
  --add-module=../form-input-nginx-module-0.11 \
  --add-module=../encrypted-session-nginx-module-0.04 \
  --add-module=../srcache-nginx-module-0.30 \
  --add-module=../ngx_lua-0.9.19 \
  --add-module=../ngx_lua_upstream-0.04 \
  --add-module=../headers-more-nginx-module-0.28 \
  --add-module=../array-var-nginx-module-0.04 \
  --add-module=../memc-nginx-module-0.16 \
  --add-module=../redis2-nginx-module-0.12 \
  --add-module=../redis-nginx-module-0.3.7 \
  --add-module=../rds-json-nginx-module-0.14 \
  --add-module=../rds-csv-nginx-module-0.07 \
  --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE)

install: all
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20151028 && cp -rv $OPENRESTY_BUILD_DIR/luajit-root/* $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.2 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL=$OPENRESTY_BUILD_DIR/install
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.04 && $OPENRESTY_BUILD_DIR/install resty $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/nginx-1.9.3 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build
