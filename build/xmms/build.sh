#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3 pkg:/system/library/math/header-math pkg:/library/glib1 pkg:/library/desktop/gtk1 pkg:/system/header/header-audio

tar xf ../../source/xmms-1.2.11.tar.bz2
cd xmms-1.2.11
sed -i -e '33414 s/*)$/* | *-*-solaris*)/g' configure
chmod a+x configure

CFLAGS="-O3" ./configure --prefix=/usr/local/xmms-1.2.11
make_all
make install


