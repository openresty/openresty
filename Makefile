.PHONY: all

all:
	./util/mirror-tarballs

test:
	cp util/configure ngx_openresty-0.8.54.0/
	cd ngx_openresty-0.8.54.0 && ./configure

