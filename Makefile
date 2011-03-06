.PHONY: all test

all:
	./util/mirror-tarballs

test: all
	prove -r t

try: all
	cd ngx_openresty-`./util/ver` && ./configure --with-luajit

