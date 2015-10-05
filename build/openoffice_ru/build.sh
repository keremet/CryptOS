#!/bin/sh

. ../../lib/functions.sh

tar xf ../../source/OOo_3.4.0_Solaris_x86_install_ru.tar.gz
mkdir -p root/var/sadm/install
DIR_TO_INSTALL_OO=$PWD/root/
cd ru/packages
for i in `ls`;do yes|pkgadd  -R $DIR_TO_INSTALL_OO -d . $i; done
cd ../..
rm -r root/var/

publish_pkg
