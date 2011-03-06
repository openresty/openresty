.PHONY: all test

all:
	./util/mirror-tarballs

test: all
	prove -r t

