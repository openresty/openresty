#!/usr/bin/env bash

#root=$(readlink -f -- "$(dirname -- "$0")/..")
root=`perl -MCwd -e'print Cwd::abs_path(shift)' $(dirname -- "$0")/..`
work=$root/work

if [ ! -d $work ]; then
    mkdir $work || exit 1
fi

url=$1
outfile=$3
cachefile=$work/$outfile
if [ -s $cachefile ]; then
    cp $work/$outfile $outfile || exit 1
else
    wget $1 -O $3 || exit 1
    if [ $? == 0 ]; then
        cp $3 $work/ || exit 1
    fi
fi

