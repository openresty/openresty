# vi:ft=
use lib '.';
use t::Config;

plan tests => 266;

#no_diff();

run_tests();

__DATA__

=== TEST 1: --help
--- cmd: ./configure --help
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix (default to /usr/local/openresty)

  --with-debug                       enable debug logging

  --with-no-pool-patch               enable the no-pool patch for debugging memory issues

  -jN                                pass -jN option to make while building LuaJIT 2.1

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
  --without-stream_lua_module        disable ngx_stream_lua_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-stream                   disable TCP/UDP proxy module
  --without-http_ssl_module          disable ngx_http_ssl_module
  --without-stream_ssl_module        disable ngx_stream_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_drizzle_module         enable ngx_http_drizzle_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua_cjson                disable the lua-cjson library
  --without-lua_tablepool            disable the lua-tablepool library (and by consequence, the
                                     lua-resty-shell library)
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
  --without-lua_resty_limit_traffic  disable the lua-resty-limit-traffic library
  --without-lua_resty_lock           disable the lua-resty-lock library
  --without-lua_resty_lrucache       disable the lua-resty-lrucache library
  --without-lua_resty_signal         disable the lua-resty-signal library (and by consequence,
                                     the lua-resty-shell library)
  --without-lua_resty_shell          disable the lua-resty-shell library
  --without-lua_resty_core           disable the lua-resty-core library

  --with-luajit=DIR                  use the external LuaJIT 2.1 installation specified by DIR
  --with-luajit-xcflags=FLAGS        Specify extra C compiler flags for LuaJIT 2.1
  --with-luajit-ldflags=FLAGS        Specify extra C linker flags for LuaJIT 2.1
  --without-luajit-lua52             Turns off the LuaJIT extensions from Lua 5.2 that may break
                                     backward compatibility
  --without-luajit-gc64              Turns off the LuaJIT GC64 mode (which is enabled by default
                                     on x86_64)

  --with-libdrizzle=DIR              specify the libdrizzle 1.0 (or drizzle) installation prefix
  --with-libpq=DIR                   specify the libpq (or postgresql) installation prefix
  --with-pg_config=PATH              specify the path of the pg_config utility

Options directly inherited from nginx

  --sbin-path=PATH                   set nginx binary pathname
  --modules-path=PATH                set modules path
  --conf-path=PATH                   set nginx.conf pathname
  --error-log-path=PATH              set error log pathname
  --pid-path=PATH                    set nginx.pid pathname
  --lock-path=PATH                   set nginx.lock pathname

  --user=USER                        set non-privileged user for
                                     worker processes
  --group=GROUP                      set non-privileged group for
                                     worker processes

  --build=NAME                       set build name
  --builddir=DIR                     set build directory

  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

  --with-threads                     enable thread pool support

  --with-file-aio                    enable file AIO support

  --with-http_ssl_module             enable ngx_http_ssl_module (default on)
  --with-http_v2_module              enable ngx_http_v2_module
  --with-http_v3_module              enable ngx_http_v3_module
  --with-http_realip_module          enable ngx_http_realip_module
  --with-http_addition_module        enable ngx_http_addition_module
  --with-http_xslt_module            enable ngx_http_xslt_module
  --with-http_xslt_module=dynamic    enable dynamic ngx_http_xslt_module
  --with-http_image_filter_module    enable ngx_http_image_filter_module
  --with-http_image_filter_module=dynamic
                                     enable dynamic ngx_http_image_filter_module
  --with-http_geoip_module           enable ngx_http_geoip_module
  --with-http_geoip_module=dynamic   enable dynamic ngx_http_geoip_module
  --with-http_sub_module             enable ngx_http_sub_module
  --with-http_dav_module             enable ngx_http_dav_module
  --with-http_flv_module             enable ngx_http_flv_module
  --with-http_mp4_module             enable ngx_http_mp4_module
  --with-http_gunzip_module          enable ngx_http_gunzip_module
  --with-http_gzip_static_module     enable ngx_http_gzip_static_module
  --with-http_auth_request_module    enable ngx_http_auth_request_module
  --with-http_random_index_module    enable ngx_http_random_index_module
  --with-http_secure_link_module     enable ngx_http_secure_link_module
  --with-http_degradation_module     enable ngx_http_degradation_module
  --with-http_slice_module           enable ngx_http_slice_module
  --with-http_stub_status_module     enable ngx_http_stub_status_module

  --without-http_charset_module      disable ngx_http_charset_module
  --without-http_gzip_module         disable ngx_http_gzip_module
  --without-http_ssi_module          disable ngx_http_ssi_module
  --without-http_userid_module       disable ngx_http_userid_module
  --without-http_access_module       disable ngx_http_access_module
  --without-http_auth_basic_module   disable ngx_http_auth_basic_module
  --without-http_mirror_module       disable ngx_http_mirror_module
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
  --without-http_grpc_module         disable ngx_http_grpc_module
  --without-http_memcached_module    disable ngx_http_memcached_module
  --without-http_limit_conn_module   disable ngx_http_limit_conn_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_hash_module
                                     disable ngx_http_upstream_hash_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module
  --without-http_upstream_least_conn_module
                                     disable ngx_http_upstream_least_conn_module
  --without-http_upstream_random_module
                                     disable ngx_http_upstream_random_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module
  --without-http_upstream_zone_module
                                     disable ngx_http_upstream_zone_module

  --with-http_perl_module            enable ngx_http_perl_module
  --with-http_perl_module=dynamic    enable dynamic ngx_http_perl_module
  --with-perl_modules_path=PATH      set Perl modules path
  --with-perl=PATH                   set perl binary pathname

  --http-log-path=PATH               set http access log pathname
  --http-client-body-temp-path=PATH  set path to store
                                     http client request body temporary files
  --http-proxy-temp-path=PATH        set path to store
                                     http proxy temporary files
  --http-fastcgi-temp-path=PATH      set path to store
                                     http fastcgi temporary files
  --http-uwsgi-temp-path=PATH        set path to store
                                     http uwsgi temporary files
  --http-scgi-temp-path=PATH         set path to store
                                     http scgi temporary files

  --without-http                     disable HTTP server
  --without-http-cache               disable HTTP cache

  --with-mail                        enable POP3/IMAP4/SMTP proxy module
  --with-mail=dynamic                enable dynamic POP3/IMAP4/SMTP proxy module
  --with-mail_ssl_module             enable ngx_mail_ssl_module
  --without-mail_pop3_module         disable ngx_mail_pop3_module
  --without-mail_imap_module         disable ngx_mail_imap_module
  --without-mail_smtp_module         disable ngx_mail_smtp_module

  --with-stream                      enable TCP/UDP proxy module (default on)
  --with-stream=dynamic              enable dynamic TCP/UDP proxy module
  --with-stream_ssl_module           enable ngx_stream_ssl_module (default on)
  --with-stream_realip_module        enable ngx_stream_realip_module
  --with-stream_geoip_module         enable ngx_stream_geoip_module
  --with-stream_geoip_module=dynamic enable dynamic ngx_stream_geoip_module
  --with-stream_ssl_preread_module   enable ngx_stream_ssl_preread_module
  --without-stream_limit_conn_module disable ngx_stream_limit_conn_module
  --without-stream_access_module     disable ngx_stream_access_module
  --without-stream_geo_module        disable ngx_stream_geo_module
  --without-stream_map_module        disable ngx_stream_map_module
  --without-stream_split_clients_module
                                     disable ngx_stream_split_clients_module
  --without-stream_return_module     disable ngx_stream_return_module
  --without-stream_upstream_hash_module
                                     disable ngx_stream_upstream_hash_module
  --without-stream_upstream_least_conn_module
                                     disable ngx_stream_upstream_least_conn_module
  --without-stream_upstream_random_module
                                     disable ngx_stream_upstream_random_module
  --without-stream_upstream_zone_module
                                     disable ngx_stream_upstream_zone_module

  --with-google_perftools_module     enable ngx_google_perftools_module
  --with-cpp_test_module             enable ngx_cpp_test_module

  --add-module=PATH                  enable external module
  --add-dynamic-module=PATH          enable dynamic external module

  --with-compat                      dynamic modules compatibility

  --with-cc=PATH                     set C compiler pathname
  --with-cpp=PATH                    set C preprocessor pathname
  --with-cc-opt=OPTIONS              set additional C compiler options
  --with-ld-opt=OPTIONS              set additional linker options
  --with-cpu-opt=CPU                 build for the specified CPU, valid values:
                                     pentium, pentiumpro, pentium3, pentium4,
                                     athlon, opteron, sparc32, sparc64, ppc64

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional build options for PCRE
  --with-pcre-jit                    build PCRE with JIT compilation support
  --without-pcre2                    do not use PCRE2 library

  --with-zlib=DIR                    set path to zlib library sources
  --with-zlib-opt=OPTIONS            set additional build options for zlib
  --with-zlib-asm=CPU                use zlib assembler sources optimized
                                     for the specified CPU, valid values:
                                     pentium, pentiumpro

  --with-libatomic                   force libatomic_ops library usage
  --with-libatomic=DIR               set path to libatomic_ops library sources

  --with-openssl=DIR                 set path to OpenSSL library sources
  --with-openssl-opt=OPTIONS         set additional build options for OpenSSL

  --dry-run                          dry running the configure, for testing only
  --platform=PLATFORM                forcibly specify a platform name, for testing only



=== TEST 2: --with-http_ssl_module & --without-http_ssl_module
--- cmd: ./configure --with-http_ssl_module --without-http_ssl_module
--- out
platform: linux (linux)

--- err
--with-http_ssl_module conflicts with --without-http_ssl_module.
--- exit: 2



=== TEST 3: default (on Linux)
--- cmd: ./configure --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 4: --with-luajit
--- cmd: ./configure --with-luajit --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 5: --with-cc-opt
--- cmd: ./configure --with-luajit --with-cc-opt="-O3" --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2 -O3' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 6: --with-ld-opt
--- cmd: ./configure --with-luajit --with-ld-opt="-llua" --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib -llua' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 7: --with-luajit & --without-http_lua_module
--- cmd: ./configure --with-luajit --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 8: --without-http_lua_module
--- cmd: ./configure --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 9: --help on solaris
--- cmd: ./configure --help --platform=solaris
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix (default to /usr/local/openresty)

  --with-debug                       enable debug logging

  --with-no-pool-patch               enable the no-pool patch for debugging memory issues

  -jN                                pass -jN option to make while building LuaJIT 2.1

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
  --without-stream_lua_module        disable ngx_stream_lua_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-stream                   disable TCP/UDP proxy module
  --without-http_ssl_module          disable ngx_http_ssl_module
  --without-stream_ssl_module        disable ngx_stream_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_drizzle_module         enable ngx_http_drizzle_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua_cjson                disable the lua-cjson library
  --without-lua_tablepool            disable the lua-tablepool library (and by consequence, the
                                     lua-resty-shell library)
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
  --without-lua_resty_limit_traffic  disable the lua-resty-limit-traffic library
  --without-lua_resty_lock           disable the lua-resty-lock library
  --without-lua_resty_lrucache       disable the lua-resty-lrucache library
  --without-lua_resty_signal         disable the lua-resty-signal library (and by consequence,
                                     the lua-resty-shell library)
  --without-lua_resty_shell          disable the lua-resty-shell library
  --without-lua_resty_core           disable the lua-resty-core library

  --with-luajit=DIR                  use the external LuaJIT 2.1 installation specified by DIR
  --with-luajit-xcflags=FLAGS        Specify extra C compiler flags for LuaJIT 2.1
  --with-luajit-ldflags=FLAGS        Specify extra C linker flags for LuaJIT 2.1
  --without-luajit-lua52             Turns off the LuaJIT extensions from Lua 5.2 that may break
                                     backward compatibility
  --without-luajit-gc64              Turns off the LuaJIT GC64 mode (which is enabled by default
                                     on x86_64)

  --with-libdrizzle=DIR              specify the libdrizzle 1.0 (or drizzle) installation prefix
  --with-libpq=DIR                   specify the libpq (or postgresql) installation prefix
  --with-pg_config=PATH              specify the path of the pg_config utility

Options directly inherited from nginx

  --sbin-path=PATH                   set nginx binary pathname
  --modules-path=PATH                set modules path
  --conf-path=PATH                   set nginx.conf pathname
  --error-log-path=PATH              set error log pathname
  --pid-path=PATH                    set nginx.pid pathname
  --lock-path=PATH                   set nginx.lock pathname

  --user=USER                        set non-privileged user for
                                     worker processes
  --group=GROUP                      set non-privileged group for
                                     worker processes

  --build=NAME                       set build name
  --builddir=DIR                     set build directory

  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

  --with-threads                     enable thread pool support

  --with-file-aio                    enable file AIO support

  --with-http_ssl_module             enable ngx_http_ssl_module (default on)
  --with-http_v2_module              enable ngx_http_v2_module
  --with-http_v3_module              enable ngx_http_v3_module
  --with-http_realip_module          enable ngx_http_realip_module
  --with-http_addition_module        enable ngx_http_addition_module
  --with-http_xslt_module            enable ngx_http_xslt_module
  --with-http_xslt_module=dynamic    enable dynamic ngx_http_xslt_module
  --with-http_image_filter_module    enable ngx_http_image_filter_module
  --with-http_image_filter_module=dynamic
                                     enable dynamic ngx_http_image_filter_module
  --with-http_geoip_module           enable ngx_http_geoip_module
  --with-http_geoip_module=dynamic   enable dynamic ngx_http_geoip_module
  --with-http_sub_module             enable ngx_http_sub_module
  --with-http_dav_module             enable ngx_http_dav_module
  --with-http_flv_module             enable ngx_http_flv_module
  --with-http_mp4_module             enable ngx_http_mp4_module
  --with-http_gunzip_module          enable ngx_http_gunzip_module
  --with-http_gzip_static_module     enable ngx_http_gzip_static_module
  --with-http_auth_request_module    enable ngx_http_auth_request_module
  --with-http_random_index_module    enable ngx_http_random_index_module
  --with-http_secure_link_module     enable ngx_http_secure_link_module
  --with-http_degradation_module     enable ngx_http_degradation_module
  --with-http_slice_module           enable ngx_http_slice_module
  --with-http_stub_status_module     enable ngx_http_stub_status_module

  --without-http_charset_module      disable ngx_http_charset_module
  --without-http_gzip_module         disable ngx_http_gzip_module
  --without-http_ssi_module          disable ngx_http_ssi_module
  --without-http_userid_module       disable ngx_http_userid_module
  --without-http_access_module       disable ngx_http_access_module
  --without-http_auth_basic_module   disable ngx_http_auth_basic_module
  --without-http_mirror_module       disable ngx_http_mirror_module
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
  --without-http_grpc_module         disable ngx_http_grpc_module
  --without-http_memcached_module    disable ngx_http_memcached_module
  --without-http_limit_conn_module   disable ngx_http_limit_conn_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_hash_module
                                     disable ngx_http_upstream_hash_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module
  --without-http_upstream_least_conn_module
                                     disable ngx_http_upstream_least_conn_module
  --without-http_upstream_random_module
                                     disable ngx_http_upstream_random_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module
  --without-http_upstream_zone_module
                                     disable ngx_http_upstream_zone_module

  --with-http_perl_module            enable ngx_http_perl_module
  --with-http_perl_module=dynamic    enable dynamic ngx_http_perl_module
  --with-perl_modules_path=PATH      set Perl modules path
  --with-perl=PATH                   set perl binary pathname

  --http-log-path=PATH               set http access log pathname
  --http-client-body-temp-path=PATH  set path to store
                                     http client request body temporary files
  --http-proxy-temp-path=PATH        set path to store
                                     http proxy temporary files
  --http-fastcgi-temp-path=PATH      set path to store
                                     http fastcgi temporary files
  --http-uwsgi-temp-path=PATH        set path to store
                                     http uwsgi temporary files
  --http-scgi-temp-path=PATH         set path to store
                                     http scgi temporary files

  --without-http                     disable HTTP server
  --without-http-cache               disable HTTP cache

  --with-mail                        enable POP3/IMAP4/SMTP proxy module
  --with-mail=dynamic                enable dynamic POP3/IMAP4/SMTP proxy module
  --with-mail_ssl_module             enable ngx_mail_ssl_module
  --without-mail_pop3_module         disable ngx_mail_pop3_module
  --without-mail_imap_module         disable ngx_mail_imap_module
  --without-mail_smtp_module         disable ngx_mail_smtp_module

  --with-stream                      enable TCP/UDP proxy module (default on)
  --with-stream=dynamic              enable dynamic TCP/UDP proxy module
  --with-stream_ssl_module           enable ngx_stream_ssl_module (default on)
  --with-stream_realip_module        enable ngx_stream_realip_module
  --with-stream_geoip_module         enable ngx_stream_geoip_module
  --with-stream_geoip_module=dynamic enable dynamic ngx_stream_geoip_module
  --with-stream_ssl_preread_module   enable ngx_stream_ssl_preread_module
  --without-stream_limit_conn_module disable ngx_stream_limit_conn_module
  --without-stream_access_module     disable ngx_stream_access_module
  --without-stream_geo_module        disable ngx_stream_geo_module
  --without-stream_map_module        disable ngx_stream_map_module
  --without-stream_split_clients_module
                                     disable ngx_stream_split_clients_module
  --without-stream_return_module     disable ngx_stream_return_module
  --without-stream_upstream_hash_module
                                     disable ngx_stream_upstream_hash_module
  --without-stream_upstream_least_conn_module
                                     disable ngx_stream_upstream_least_conn_module
  --without-stream_upstream_random_module
                                     disable ngx_stream_upstream_random_module
  --without-stream_upstream_zone_module
                                     disable ngx_stream_upstream_zone_module

  --with-google_perftools_module     enable ngx_google_perftools_module
  --with-cpp_test_module             enable ngx_cpp_test_module

  --add-module=PATH                  enable external module
  --add-dynamic-module=PATH          enable dynamic external module

  --with-compat                      dynamic modules compatibility

  --with-cc=PATH                     set C compiler pathname
  --with-cpp=PATH                    set C preprocessor pathname
  --with-cc-opt=OPTIONS              set additional C compiler options
  --with-ld-opt=OPTIONS              set additional linker options
  --with-cpu-opt=CPU                 build for the specified CPU, valid values:
                                     pentium, pentiumpro, pentium3, pentium4,
                                     athlon, opteron, sparc32, sparc64, ppc64

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional build options for PCRE
  --with-pcre-jit                    build PCRE with JIT compilation support
  --without-pcre2                    do not use PCRE2 library

  --with-zlib=DIR                    set path to zlib library sources
  --with-zlib-opt=OPTIONS            set additional build options for zlib
  --with-zlib-asm=CPU                use zlib assembler sources optimized
                                     for the specified CPU, valid values:
                                     pentium, pentiumpro

  --with-libatomic                   force libatomic_ops library usage
  --with-libatomic=DIR               set path to libatomic_ops library sources

  --with-openssl=DIR                 set path to OpenSSL library sources
  --with-openssl-opt=OPTIONS         set additional build options for OpenSSL

  --dry-run                          dry running the configure, for testing only
  --platform=PLATFORM                forcibly specify a platform name, for testing only



=== TEST 10: --with-http_drizzle_module on solaris
--- cmd: ./configure --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../drizzle-nginx-module-0.1.12 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 11: --with-http_drizzle_module on Solaris
--- cmd: ./configure --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../drizzle-nginx-module-0.1.12 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 12: ngx_drizzle not enabled but specify --with-libdrizzle
--- cmd: ./configure --with-libdrizzle=/opt/drizzle --dry-run
--- out
platform: linux (linux)

--- err
The http_drizzle_module is not enabled while --with-libdrizzle is specified.
--- exit: 2



=== TEST 13: ngx_drizzle enabled and --with-libdrizzle is specified
--- cmd: ./configure --with-libdrizzle=/opt/drizzle --with-http_drizzle_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LIBDRIZZLE_LIB='/opt/drizzle/lib'
export LIBDRIZZLE_INC='/opt/drizzle/include/libdrizzle-1.0'
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../drizzle-nginx-module-0.1.12 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/opt/drizzle/lib:/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 14: --with-cc on Solaris
--- cmd: ./configure --with-cc=gcc-4.2 --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC='gcc-4.2' PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC='gcc-4.2' PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-cc=gcc-4.2 --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC='gcc-4.2' PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC='gcc-4.2' PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC='gcc-4.2'
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
--- err
Can't exec "gcc-4.2": No such file or directory at ./configure line 719.



=== TEST 15: --with-debug & luajit
--- cmd: ./configure --with-luajit --with-debug --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 16: --with-debug & luajit & --with-cc=cl
--- cmd: ./configure --with-luajit --with-debug --dry-run --with-cc=cl
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-cc=cl --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC='cl' PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC='cl'
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
--- err
Can't exec "cl": No such file or directory at ./configure line 719.



=== TEST 17: ngx_postgres not enabled but specify --with-libpq
--- cmd: ./configure --with-libpq=/opt/postgres --dry-run
--- out
platform: linux (linux)

--- err
The http_postgres_module is not enabled while --with-libpq is specified.
--- exit: 2



=== TEST 18: ngx_postgres enabled and --with-libpq is specified
--- cmd: ./configure --with-libpq=/opt/postgres --with-http_postgres_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LIBPQ_LIB='/opt/postgres/lib'
export LIBPQ_INC='/opt/postgres/include'
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../ngx_postgres-1.0 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/opt/postgres/lib:/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 19: with iconv
--- cmd: ./configure --with-http_iconv_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../iconv-nginx-module-0.14 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 20: --with-libpq & --with-pg_config
--- cmd: ./configure --with-libpq=/foo/bar --with-pg_config=/baz
--- out

--- err
--with-pg_config is not allowed when --with-libpq is already specified.
--- exit: 255



=== TEST 21: --with-pg_config & --with-libpq
--- cmd: ./configure --with-pg_config=/baz --with-libpq=/foo/bar
--- out

--- err
--with-libpq is not allowed when --with-pg_config is already specified.
--- exit: 255



=== TEST 22: ngx_postgres not enabled but specify --with-pg_config
--- cmd: ./configure --with-pg_config=pg_config --dry-run
--- out
platform: linux (linux)

--- err
The http_postgres_module is not enabled while --with-pg_config is specified.
--- exit: 2



=== TEST 23: --with-make option
--- cmd: ./configure --with-make=make --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
make TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
make install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    make
    make install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 24: --with-luajit on Solaris
--- cmd: ./configure --with-luajit --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 25: default on Solaris
--- cmd: ./configure --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 26: default on FreeBSD
--- cmd: ./configure --dry-run --platform=freebsd
--- out
platform: freebsd (freebsd)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 27: --with-luajit on FreeBSD
--- cmd: ./configure --with-luajit --dry-run --platform=freebsd
--- out
platform: freebsd (freebsd)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 28: --with-luajit on Mac OS X
--- cmd: ./configure --dry-run --platform=darwin --with-luajit
--- out
platform: macosx (darwin)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
--- err
Can't exec "sw_vers": No such file or directory at ./configure line 793.
Use of uninitialized value $v in scalar chomp at ./configure line 794.



=== TEST 29: default on Mac OS X
--- cmd: ./configure --dry-run --platform=darwin
--- out
platform: macosx (darwin)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
--- err
Can't exec "sw_vers": No such file or directory at ./configure line 793.
Use of uninitialized value $v in scalar chomp at ./configure line 794.



=== TEST 30: --with-debug on solaris
--- cmd: ./configure --dry-run --platform=solaris --with-debug
--- out
platform: solaris (solaris)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT' INSTALL_X='$(INSTALL) -m 0755' INSTALL_F='$(INSTALL) -m 0644' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic -DUSE_INTERNAL_ISINF" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)' CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 31: --without-lua_cjson
--- cmd: ./configure --dry-run --without-lua_cjson
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 32: --without-lua_tablepool
--- cmd: ./configure --dry-run --without-lua_tablepool
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 33: --without-lua_resty_shell
--- cmd: ./configure --dry-run --without-lua_resty_shell
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 34: --without-lua_resty_signal
--- cmd: ./configure --dry-run --without-lua_resty_signal
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 35: --without-lua_redis_parser & --without-lua_cjson
--- cmd: ./configure --dry-run --without-lua_redis_parser --without-lua_cjson
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 36: disable rds-parser
--- cmd: ./configure --dry-run --without-lua_rds_parser
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 37: --with-luajit=PATH
--- cmd: ./configure --with-luajit=/tmp/luajit --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
export LUAJIT_LIB='/tmp/luajit/lib'
export LUAJIT_INC='/tmp/luajit/include/luajit-2.1'
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/tmp/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/tmp/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 38: ./configure with -jN
--- cmd: ./configure --dry-run -j10
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake -j10 TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 39: --with-luajit & -jN
--- cmd: ./configure --with-luajit --dry-run -j5
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake -j5 TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 40: relative path as the --add-module option's value
--- cmd: ./configure --add-module=/path/to/some/module --add-module=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --add-module=/path/to/some/module --add-module=$OPENRESTY_DIR/../some/module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 41: relative path as the --with-openssl option's value
--- cmd: ./configure --with-openssl=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-openssl=$OPENRESTY_DIR/../some/module --with-openssl-opt=-g --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 42: --without-lua_resty_memcached
--- cmd: ./configure --dry-run --without-lua_resty_memcached
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 43: --without-lua_resty_redis
--- cmd: ./configure --dry-run --without-lua_resty_redis
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 44: --with-luajit-xcflags
--- cmd: ./configure --with-luajit --with-luajit-xcflags='-DLUAJIT_USE_VALGRIND' --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 45: --with-debug & luajit & --with-luajit-xcflags
--- cmd: ./configure --with-luajit --with-debug --dry-run --with-luajit-xcflags='-DLUAJIT_USE_VALGRIND'
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC -O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUA_USE_APICHECK -DLUA_USE_ASSERT -DLUAJIT_USE_VALGRIND' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 46: relative path as the --with-pcre option's value
--- cmd: ./configure --with-pcre=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-pcre=$OPENRESTY_DIR/../some/module --with-pcre-opt=-g --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 47: relative path as the --with-zlib option's value
--- cmd: ./configure --with-zlib=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-zlib=$OPENRESTY_DIR/../some/module --with-zlib-opt=-g --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 48: relative path as the --with-md5 option's value
--- cmd: ./configure --with-md5=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-md5=$OPENRESTY_DIR/../some/module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 49: relative path as the --with-sha1 option's value
--- cmd: ./configure --with-sha1=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-sha1=$OPENRESTY_DIR/../some/module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 50: relative path as the --with-libatomic option's value
--- cmd: ./configure --with-libatomic=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-libatomic=$OPENRESTY_DIR/../some/module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 51: --without-lua_resty_dns
--- cmd: ./configure --dry-run --without-lua_resty_dns
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 52: --prefix (relative path: "."), lua51
--- cmd: ./configure --prefix=. --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)./
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)./bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)./
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)./site/lualib $(DESTDIR)./site/pod $(DESTDIR)./site/manifest
	ln -sf ./nginx/sbin/nginx $(DESTDIR)./bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 53: --prefix (relative path: "."), luajit
--- cmd: ./configure --prefix=. --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)./
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)./bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)./
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)./site/lualib $(DESTDIR)./site/pod $(DESTDIR)./site/manifest
	ln -sf ./nginx/sbin/nginx $(DESTDIR)./bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 54: --prefix (relative path: ""), luajit
--- cmd: ./configure --prefix= --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=./nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)./
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/luajit/include/luajit-2.1 LUA_LIB_DIR=./lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)./bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)./bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)./
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)./site/lualib $(DESTDIR)./site/pod $(DESTDIR)./site/manifest
	ln -sf ./nginx/sbin/nginx $(DESTDIR)./bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 55: MSYS platform
--- cmd: ./configure --prefix= --platform=msys --dry-run
--- out
platform: msys (msys)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
install -m 0755 src/luajit.exe src/lua51.dll $OPENRESTY_BUILD_DIR/luajit-root/
mkdir -p $OPENRESTY_BUILD_DIR/luajit-root/lua/jit
install -m 0644 src/jit/*.lua $OPENRESTY_BUILD_DIR/luajit-root/lua/jit/
mkdir -p $OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1
cd src && install -m 0644 lua.h lualib.h lauxlib.h luaconf.h lua.hpp luajit.h $OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1'
cd ..
cd nginx-1.29.1
sh ./configure --prefix=. \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
DESTDIR ?= $OPENRESTY_DIR/

INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=./luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)./
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && cp -rv $OPENRESTY_BUILD_DIR/luajit-root/* $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_CMODULE_DIR=./lualib LUA_MODULE_DIR=./lualib CJSON_LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/include/luajit-2.1 LUA_LIB_DIR=./lualib LDFLAGS="-shared -L$OPENRESTY_BUILD_DIR/luajit-root -llua51" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=./lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)./'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)./'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)./
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)./
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)./
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)./site/lualib $(DESTDIR)./site/pod $(DESTDIR)./site/manifest

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 56: --with-pcre-opt='foo bar'
--- cmd: ./configure --dry-run --with-pcre-opt='-foo -bar' --with-zlib-opt="hello, '\world"
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  '--with-pcre-opt=-g -foo -bar' $'--with-zlib-opt=-g hello, \'\\world' --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 57: --with-luajit-xcflags lua 5.2 compat
--- cmd: ./configure --with-luajit-xcflags='-DLUAJIT_ENABLE_LUA52COMPAT' --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 58: --without-luajit-lua52
--- cmd: ./configure --without-luajit-lua52 --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 59: --with-luajit-xcflags disable gc64
--- cmd: ./configure --with-luajit-xcflags='-DLUAJIT_DISABLE_GC64' --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 60: --without-luajit-gc64
--- cmd: ./configure --without-luajit-gc64 --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 61: --with-luajit-xcflags gc64 & --without-luajit-gc64
--- cmd: ./configure --with-luajit-xcflags='-DLUAJIT_DISABLE_GC64' --without-luajit-gc64 --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_DISABLE_GC64' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 62: --sbin-path (absolute)
--- cmd: ./configure --sbin-path=/opt/blah/nginx --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --sbin-path=/opt/blah/nginx --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /opt/blah/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 63: --sbin-path (relative)
--- cmd: ./configure --sbin-path=../bin/nginx --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --sbin-path=../bin/nginx --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf ../bin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 64: --without-http_lua_upstream_module (on Linux)
--- cmd: ./configure --dry-run --without-http_lua_upstream_module
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 65: --without-http_lua_module & --without-stream_lua_module
--- cmd: ./configure --without-http_lua_module --without-stream_lua_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 66: relative path as the --add-dynamic-module option's value
--- cmd: ./configure --add-dynamic-module=/path/to/some/module --add-dynamic-module=../some/module/ --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --add-dynamic-module=/path/to/some/module --add-dynamic-module=$OPENRESTY_DIR/../some/module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*



=== TEST 67: --without-stream_ssl_module and --without-http_ssl_module are respected
--- cmd: ./configure --without-http_ssl_module --without-stream_ssl_module --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_preread_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install



=== TEST 68: --without-stream_ssl_module and --with-stream_ssl_module specified at the same time causes errors
--- cmd: ./configure --with-stream_ssl_module --without-stream_ssl_module --dry-run
--- out
platform: linux (linux)

--- err
--with-stream_ssl_module conflicts with --without-stream_ssl_module.
--- exit: 2



=== TEST 69: --with-luajit-ldflags
--- cmd: ./configure --with-luajit --with-luajit-ldflags='-Wl,-rpath,/tmp/blah/foo' --dry-run
--- out
platform: linux (linux)
cp -rp bundle/ build
cd build
cd LuaJIT-2.1-20250117
gmake TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' LDFLAGS='-Wl,-rpath,/tmp/blah/foo' CC=cc PREFIX=/usr/local/openresty/luajit
gmake install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' LDFLAGS='-Wl,-rpath,/tmp/blah/foo' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root/
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1'
cd ..
patching the resty script with hard-coded nginx binary path...
cd nginx-1.29.1
sh ./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../ngx_devel_kit-0.3.3 \
  --add-module=../echo-nginx-module-0.63 \
  --add-module=../xss-nginx-module-0.06 \
  --add-module=../ngx_coolkit-0.2 \
  --add-module=../set-misc-nginx-module-0.33 \
  --add-module=../form-input-nginx-module-0.12 \
  --add-module=../encrypted-session-nginx-module-0.09 \
  --add-module=../srcache-nginx-module-0.33 \
  --add-module=../ngx_lua-0.10.28 \
  --add-module=../ngx_lua_upstream-0.07 \
  --add-module=../headers-more-nginx-module-0.39 \
  --add-module=../array-var-nginx-module-0.06 \
  --add-module=../memc-nginx-module-0.20 \
  --add-module=../redis2-nginx-module-0.15 \
  --add-module=../redis-nginx-module-0.3.9 \
  --add-module=../rds-json-nginx-module-0.17 \
  --add-module=../rds-csv-nginx-module-0.09 \
  --add-module=../ngx_stream_lua-0.0.16 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module
cd ../..
Type the following commands to build and install:
    gmake
    gmake install

--- makefile
INSTALL := $OPENRESTY_BUILD_DIR/install

.PHONY: all install clean

all:
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' LDFLAGS='-Wl,-rpath,/tmp/blah/foo' CC=cc PREFIX=/usr/local/openresty/luajit
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp $OPENRESTY_DIR/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/LuaJIT-2.1-20250117 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' LDFLAGS='-Wl,-rpath,/tmp/blah/foo' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd $OPENRESTY_BUILD_DIR/lua-cjson-2.1.0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-signal-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd $OPENRESTY_BUILD_DIR/lua-resty-dns-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-memcached-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-redis-0.33 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-mysql-0.28 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-string-0.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upload-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-websocket-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lock-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-lrucache-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-core-0.1.31 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-upstream-healthcheck-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-limit-traffic-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	cd $OPENRESTY_BUILD_DIR/lua-tablepool-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL='$(INSTALL)'
	mkdir -p '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/opm-0.0.8 && $(INSTALL) bin/* '$(DESTDIR)/usr/local/openresty/bin/'
	cd $OPENRESTY_BUILD_DIR/resty-cli-0.30 && $(INSTALL) bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp $OPENRESTY_BUILD_DIR/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r $OPENRESTY_BUILD_DIR/pod $(DESTDIR)/usr/local/openresty/
	cd $OPENRESTY_BUILD_DIR/nginx-1.29.1 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*

