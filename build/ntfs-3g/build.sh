#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3

tar xf ../../source/ntfs-3g_ntfsprogs-2015.3.14.tgz
cd ntfs-3g_ntfsprogs-2015.3.14
CFLAGS="-O3" ./configure --prefix=/usr/local/ntfs-3g
make_all
make install

cd ..

publish_pkg
