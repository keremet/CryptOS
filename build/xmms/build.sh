#!/bin/sh

. ../../lib/functions.sh

pkg install cryptos/gcc pkg:/library/glib1 pkg:/library/desktop/gtk1 pkg:/system/header/header-audio

tar xf ../../source/xmms-1.2.11.tar.bz2
cd xmms-1.2.11
sed -i -e '33414 s/*)$/* | *-*-solaris*)/g' configure
chmod a+x configure

PATH=/usr/local/bin:$PATH

CFLAGS="-O3" LDFLAGS="-R/usr/local/lib" ./configure --prefix=/usr/local/xmms-1.2.11
make_all
make install


