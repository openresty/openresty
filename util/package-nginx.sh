#!/bin/bash

. ./util/ver
ver=$main_ver

cd ..
if [ ! -d nginx ]; then
    echo "../nginx/ not found." > /dev/stderr
    exit 1
fi
if [ ! -d nginx/.git ]; then
    echo "../nginx/.git not found." > /dev/stderr
    exit 1
fi

cd nginx || exit 1
git pull --force || exit 1
cd .. || exit 1

rm -rf nginx-$ver
rm -f nginx-$ver.tar.gz
git clone nginx nginx-$ver || exit 1
cd nginx-$ver/ || exit 1
git co release-$ver || exit 1
rm -rf .git || exit 1
rm .hgtags || exit 1
mv docs/text/README ./ || exit 1
mv auto/configure ./ || exit 1
rm -rf src/mysql || exit 1
cd ..
tar czvf nginx-$ver.tar.gz nginx-$ver || exit 1
ls -lh ./nginx-$ver.tar.gz
#ls -lh ~/work/nginx-$ver.tar.gz
scp nginx-$ver.tar.gz agentzh.org:~/www/agentzh/misc/nginx/
