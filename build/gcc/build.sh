#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3 pkg:/developer/build/gnu-make pkg:/text/gawk pkg:/system/library/math/header-math pkg:/developer/object-file

tar xf ../../source/binutils-2.25.1.tar.bz2
cd binutils-2.25.1
CFLAGS="-O3" ./configure
make_all
make install

cd ..

tar xf ../../source/gcc-5.2.0.tar.bz2
cd gcc-5.2.0
#see ./contrib/download_prerequisites
tar xf ../../../source/mpfr-2.4.2.tar.bz2
ln -sf mpfr-2.4.2 mpfr

tar xf ../../../source/gmp-4.3.2.tar.bz2
ln -sf gmp-4.3.2 gmp

tar xf ../../../source/mpc-0.8.1.tar.gz
ln -sf mpc-0.8.1 mpc

tar xf ../../../source/isl-0.14.tar.bz2
ln -sf isl-0.14 isl

cd ..
mkdir objdir
cd objdir
CFLAGS="-O3" CXXFLAGS="-O3" $PWD/../gcc-5.2.0/configure --enable-languages=c,c++ --with-gnu-as --with-as=/usr/local/bin/as --without-gnu-ld --with-ld=/usr/ccs/bin/ld
#Для c++filt
export PATH=/usr/local/bin:$PATH
make_all
make install

publish_pkg
