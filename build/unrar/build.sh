#!/bin/sh

. ../../lib/functions.sh

rm -rf unrar
tar xf ../../source/unrarsrc-5.3.2.tar.gz
cd unrar
sed -i -e '6 s/-O2$/-O3/g' -e '10 s|-pthread|-R/usr/local/lib|g' makefile
make_all
