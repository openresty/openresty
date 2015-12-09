#!/bin/bash

name=`pwd|perl -e '$d=<>;$d=~s{.*?/}{}g;$d=~s/$//g;print $d'`
name="$name-win32"
echo $name
if [ -d $name ]; then
    rm -rf $name
fi
mkdir $name || exit 1
cp -r resty nginx.exe luajit.exe lua51.dll lua include lualib html conf logs $name/ || exit 1
cp COPYRIGHT $name/ || exit 1
cp /c/MinGW/bin/libgcc_s_dw2-1.dll $name/ || exit 1
cd $name || exit 1
PATH=/c/Strawberry/perl/bin:$PATH cmd /c 'pl2bat.bat resty' || exit 1
cp ../README-win32.txt README.txt
unix2dos conf/* html/*.html resty || exit 1
cd .. || exit 1
zip -r $name.zip $name || exit 1
echo $name.zip
