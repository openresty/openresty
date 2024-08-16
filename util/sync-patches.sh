#!/bin/bash
set -e
#set -x

if [ $# -ne 2 ]; then
    echo "Usage: $0 old_ver new_ver"
    exit 1
fi

old=$1
new=$2

old_num=$(echo $old | awk -F. '{printf("%d", $1 * 1000000 + $2 * 1000 + $3)}')
new_num=$(echo $new | awk -F. '{printf("%d", $1 * 1000000 + $2 * 1000 + $3)}')

old_pat=$(echo $old | sed 's/\./\\./g')
topdir=`dirname $0`
topdir="$topdir/.."

cd $topdir/patches

for file in `ls | grep nginx-$old`; do
    #echo $file
    new_file=`echo $file | sed s/1.27.0/1.27.1/`
    sed "s/$old_pat/$new/g" $file | sed "s/\b$old_num\b/$new_num/g" > $new_file
done
