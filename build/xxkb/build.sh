#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3 pkg:/system/library/math/header-math 

tar xf ../../source/xxkb-1.11.1-src.tar.gz
cd xxkb-1.11.1
CFLAGS="-O3 -Dsun -Di386 -DSVR4 -D__EXTENSIONS__ -D__i386 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DAPPDEFDIR=\"/usr/lib/X11/app-defaults\" -DAPPDEFFILE=\"XXkb\" -DXT_RESOURCE_SEARCH -DSHAPE_EXT"

gcc $CFLAGS -c -o xxkb.o xxkb.c
gcc $CFLAGS -c -o resource.o resource.c
gcc $CFLAGS -c -o wlist.o wlist.c
gcc -o xxkb xxkb.o resource.o wlist.o -lX11 -lXext -lXpm -lXt -lsocket -lnsl

cd ..

publish_pkg
