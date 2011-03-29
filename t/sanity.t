# vi:ft=

use t::Config;

plan tests => 4 * blocks() - 3;

#no_diff();

run_tests();

__DATA__

=== TEST 1: --help
--- cmd: ./configure --help
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix

  --with-debug                       enable the debugging logging and also enable -O0

  --without-http_echo_module         disable ngx_http_echo_module
  --without-http_xss_module          disable ngx_http_xss_module
  --without-http_set_misc_module     disable ngx_http_set_misc_module
  --without-http_form_input_module   disable ngx_http_form_input_module
  --without-http_encrypted_session_module
                                     disable ngx_http_encrypted_session_module
  --without-http_drizzle_module      disable ngx_http_drizzle_module
  --without-http_lua_module          disable ngx_http_lua_module
  --without-http_headers_more_module disable ngx_http_headers_more_module
  --without-http_srcache_module      disable ngx_http_srcache_module
  --without-http_array_var_module    disable ngx_http_array_var_module
  --without-http_memc_module         disable ngx_http_memc_module
  --without-http_redis2_module       disable ngx_http_redis2_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module
  --without-http_auth_request_module disable ngx_http_auth_request_module
  --without-http_rds_json_module     disable ngx_http_rds_json_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-http_ssl_module          disable ngx_http_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua51                    disable the bundled Lua 5.1 interpreter
  --with-luajit                      enable LuaJIT 2.0

Options directly inherited from nginx

  --sbin-path=PATH                   set path to the nginx binary file
  --conf-path=PATH                   set path to the nginx.conf file
  --error-log-path=PATH              set path to the error log
  --pid-path=PATH                    set path to nginx.pid file
  --lock-path=PATH                   set path to nginx.lock file

  --user=USER                        set non-privilege user
                                     for the worker processes
  --group=GROUP                      set non-privilege group
                                     for the worker processes

  --builddir=DIR                     set the build directory

  --with-rtsig_module                enable rtsig module
  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

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
  --without-http_limit_zone_module   disable ngx_http_limit_zone_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module

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

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional options for PCRE building

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



=== TEST 2: default
--- cmd: ./configure --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd lua-5.1.4
make linux
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/lua-5.1.4 && $(MAKE) linux
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 3: --with-debug
--- cmd: ./configure --with-debug --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd lua-5.1.4
make linux
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-debug \
  --with-cc-opt='-O0' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/lua-5.1.4 && $(MAKE) linux
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 4: --with-http_ssl_module & --without-http_ssl_module
--- cmd: ./configure --with-http_ssl_module --without-http_ssl_module
--- exit: 255
--- err
--with-http_ssl_module conflicts with --without-http_ssl_module
--- out
platform: linux (linux)



=== TEST 5: --with-luajit
--- cmd: ./configure --with-luajit --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib:/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 6: --with-cc-opt
--- cmd: ./configure --with-luajit --with-cc-opt="-O3" --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2 -O3' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib:/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 7: --with-ld-opt
--- cmd: ./configure --with-luajit --with-ld-opt="-llua" --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib:/usr/local/openresty/luajit/lib -llua' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 8: --without-http_drizzle_module
--- cmd: ./configure --with-luajit --without-http_drizzle_module --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 9: --with-luajit & --without-http_lua_module
--- cmd: ./configure --with-luajit --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib:/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 10: --without-http_lua_module
--- cmd: ./configure --without-http_lua_module --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 11: --without-http_drizzle_module & --with-http_postgres_module
--- cmd: ./configure --with-luajit --without-http_drizzle_module --with-http_postgres_module --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../ngx_postgres-0.8 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 12: --without-http_drizzle_module & --with-http_iconv_module
--- cmd: ./configure --with-luajit --without-http_drizzle_module --with-http_iconv_module --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd LuaJIT-2.0.0-beta6
make PREFIX=/usr/local/openresty/luajit
make install PREFIX=/usr/local/openresty/luajit DESTDIR=$OPENRESTY_BUILD_DIR/luajit-root
export LUAJIT_LIB='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/lib'
export LUAJIT_INC='$OPENRESTY_BUILD_DIR/luajit-root/usr/local/openresty/luajit/include/luajit-2.0'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../iconv-nginx-module-0.10rc3 \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/luajit/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) PREFIX=/usr/local/openresty/luajit
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/LuaJIT-2.0.0-beta6 && $(MAKE) install PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 13: --prefix
--- cmd: ./configure --prefix=/opt/blah --dry-run
--- out
platform: linux (linux)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/opt/blah/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/opt/blah/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/opt/blah/libdrizzle/include'
cd ..
cd lua-5.1.4
make linux
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/opt/blah/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/opt/blah/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/opt/blah/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/lua-5.1.4 && $(MAKE) linux
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/opt/blah/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 14: --help on solaris
--- cmd: ./configure --help --platform=solaris
--- out
  --help                             this message

  --prefix=PATH                      set the installation prefix

  --with-debug                       enable the debugging logging and also enable -O0

  --without-http_echo_module         disable ngx_http_echo_module
  --without-http_xss_module          disable ngx_http_xss_module
  --without-http_set_misc_module     disable ngx_http_set_misc_module
  --without-http_form_input_module   disable ngx_http_form_input_module
  --without-http_encrypted_session_module
                                     disable ngx_http_encrypted_session_module
  --without-http_lua_module          disable ngx_http_lua_module
  --without-http_headers_more_module disable ngx_http_headers_more_module
  --without-http_srcache_module      disable ngx_http_srcache_module
  --without-http_array_var_module    disable ngx_http_array_var_module
  --without-http_memc_module         disable ngx_http_memc_module
  --without-http_redis2_module       disable ngx_http_redis2_module
  --without-http_upstream_keepalive_module
                                     disable ngx_http_upstream_keepalive_module
  --without-http_auth_request_module disable ngx_http_auth_request_module
  --without-http_rds_json_module     disable ngx_http_rds_json_module
  --without-ngx_devel_kit_module     disable ngx_devel_kit_module
  --without-http_ssl_module          disable ngx_http_ssl_module

  --with-http_iconv_module           enable ngx_http_iconv_module
  --with-http_drizzle_module         enable ngx_http_drizzle_module
  --with-http_postgres_module        enable ngx_http_postgres_module

  --without-lua51                    disable the bundled Lua 5.1 interpreter
  --with-luajit                      enable LuaJIT 2.0

Options directly inherited from nginx

  --sbin-path=PATH                   set path to the nginx binary file
  --conf-path=PATH                   set path to the nginx.conf file
  --error-log-path=PATH              set path to the error log
  --pid-path=PATH                    set path to nginx.pid file
  --lock-path=PATH                   set path to nginx.lock file

  --user=USER                        set non-privilege user
                                     for the worker processes
  --group=GROUP                      set non-privilege group
                                     for the worker processes

  --builddir=DIR                     set the build directory

  --with-rtsig_module                enable rtsig module
  --with-select_module               enable select module
  --without-select_module            disable select module
  --with-poll_module                 enable poll module
  --without-poll_module              disable poll module

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
  --without-http_limit_zone_module   disable ngx_http_limit_zone_module
  --without-http_limit_req_module    disable ngx_http_limit_req_module
  --without-http_empty_gif_module    disable ngx_http_empty_gif_module
  --without-http_browser_module      disable ngx_http_browser_module
  --without-http_upstream_ip_hash_module
                                     disable ngx_http_upstream_ip_hash_module

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

  --without-pcre                     disable PCRE library usage
  --with-pcre                        force PCRE library usage
  --with-pcre=DIR                    set path to PCRE library sources
  --with-pcre-opt=OPTIONS            set additional options for PCRE building

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



=== TEST 15: default on solaris
--- cmd: ./configure --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -r bundle/ build/
cd build
cd lua-5.1.4
make solaris
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/lua-5.1.4 && $(MAKE) solaris
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 16: --with-http_drizzle_module on solaris
--- cmd: ./configure --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd lua-5.1.4
make solaris
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/lua-5.1.4 && $(MAKE) solaris
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build



=== TEST 17: --with-http_drizzle_module on Solaris
--- cmd: ./configure --with-http_drizzle_module --dry-run --platform=solaris
--- out
platform: solaris (solaris)
cp -r bundle/ build/
cd build
cd libdrizzle-0.8
./configure --prefix=/usr/local/openresty/libdrizzle
make
make install DESTDIR=$OPENRESTY_BUILD_DIR/libdrizzle-root
export LIBDRIZZLE_LIB='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/lib'
export LIBDRIZZLE_INC='$OPENRESTY_BUILD_DIR/libdrizzle-root/usr/local/openresty/libdrizzle/include'
cd ..
cd lua-5.1.4
make solaris
make install INSTALL_TOP=$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua
export LUA_LIB='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/lib'
export LUA_INC='$OPENRESTY_BUILD_DIR/lua-root/usr/local/openresty/lua/include'
cd ..
cd nginx-0.8.54
./configure --prefix=/usr/local/openresty/nginx \
  --with-cc-opt='-O2' \
  --add-module=../echo-nginx-module-0.36rc2 \
  --add-module=../xss-nginx-module-0.03rc2 \
  --add-module=../ngx_devel_kit-0.2.17 \
  --add-module=../set-misc-nginx-module-0.21 \
  --add-module=../form-input-nginx-module-0.07rc4 \
  --add-module=../encrypted-session-nginx-module-0.01 \
  --add-module=../drizzle-nginx-module-0.0.15rc9 \
  --add-module=../ngx_lua-0.1.6rc3 \
  --add-module=../headers-more-nginx-module-0.15rc1 \
  --add-module=../srcache-nginx-module-0.12rc2 \
  --add-module=../array-var-nginx-module-0.02 \
  --add-module=../memc-nginx-module-0.12rc1 \
  --add-module=../redis2-nginx-module-0.06 \
  --add-module=../upstream-keepalive-nginx-module-0.3 \
  --add-module=../auth-request-nginx-module-0.2 \
  --add-module=../rds-json-nginx-module-0.11rc2 \
  --with-ld-opt='-Wl,-rpath,/usr/local/openresty/libdrizzle/lib' \
  --with-http_ssl_module
cd ../..
--- makefile
.PHONY: all install

all:
	cd build/libdrizzle-0.8 && $(MAKE)
	cd build/lua-5.1.4 && $(MAKE) solaris
	cd build/nginx-0.8.54 && $(MAKE)

install:
	cd build/libdrizzle-0.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	cd build/lua-5.1.4 && $(MAKE) install INSTALL_TOP=$(DESTDIR)/usr/local/openresty/lua
	cd build/nginx-0.8.54 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build

