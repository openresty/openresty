.PHONY: all test try-luajit try-lua

all:
	./util/mirror-tarballs

test:
	prove -I. -I../test-nginx/lib -r t

try-luajit: all
	cd openresty-`./util/ver` && ./configure --with-luajit

try-lua: all
	cd openresty-`./util/ver` && ./configure && $(MAKE)

