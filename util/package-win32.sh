#!/bin/bash

mingw32=/c/msys64/mingw32

info=`uname -a`
if [[ "$info" == MINGW64* ]]; then
    arch="win64";
else
    if [[ "$info" == MINGW32* ]]; then
        arch="win32";
    else
        echo "Unknown architecture: $info" > /dev/stderr
        exit 1
    fi
fi

echo $arch

name=`pwd|perl -e '$d=<>;$d=~s{.*?/}{}g;$d=~s/$//g;print $d'`
name="$name-$arch"
echo $name
if [ -d $name ]; then
    rm -rf $name
fi
mkdir $name || exit 1
cp -r resty restydoc restydoc-index nginx.exe luajit.exe lua51.dll lua include lualib html conf logs pod $name/ || exit 1
cp COPYRIGHT $name/ || exit 1
if [[ "$arch" == "win32" ]]; then
    cp $mingw32/bin/libgcc_s_dw2-1.dll $name/ || exit 1
    cp $mingw32/bin/libwinpthread-1.dll $name/ || exit 1
fi
cd $name || exit 1
PATH=/c/Strawberry/perl/bin:$PATH cmd /c 'pl2bat.bat resty' || exit 1
PATH=/c/Strawberry/perl/bin:$PATH cmd /c 'pl2bat.bat restydoc' || exit 1
PATH=/c/Strawberry/perl/bin:$PATH cmd /c 'pl2bat.bat restydoc-index' || exit 1
cp ../README-windows.txt README.txt
unix2dos conf/* html/*.html resty || exit 1
cd .. || exit 1
zip -r $name.zip $name || exit 1
echo $name.zip
