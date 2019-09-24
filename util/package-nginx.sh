#!/usr/bin/env bash

set -e

. ./util/ver

cd ..
if [ ! -d nginx ]; then
    echo "../nginx/ not found." > /dev/stderr
    exit 1
fi
if [ ! -d nginx/.git ]; then
    echo "../nginx/.git not found." > /dev/stderr
    exit 1
fi

cd nginx
git reset --hard
git checkout master
git pull --force
cd ..

rm -rf nginx-$nginx_ver
rm -f nginx-$nginx_ver.tar.gz
git clone nginx nginx-$nginx_ver
cd nginx-$nginx_ver/
git co release-$nginx_ver
rm -rf .git
rm .hgtags
mv docs/text/README ./
mv auto/configure ./
rm -rf src/mysql
cd ..
tar czvf nginx-$nginx_ver.tar.gz nginx-$nginx_ver
ls -lh ./nginx-$nginx_ver.tar.gz
#ls -lh ~/work/nginx-$nginx_ver.tar.gz
scp nginx-$nginx_ver.tar.gz openresty.org:/home/agentz/www/agentzh/misc/nginx/
