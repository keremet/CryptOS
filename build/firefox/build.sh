#!/bin/sh

. ../../lib/functions.sh

bunzip2 < ../../source/firefox-31.0.en-US.opensolaris-i386-pkg.bz2 > firefox-31.0.en-US.opensolaris-i386-pkg
mkdir -p root/var/sadm/install
pkgadd -R $PWD/root/ -d firefox-31.0.en-US.opensolaris-i386-pkg all
rm -r root/var/

publish_pkg
