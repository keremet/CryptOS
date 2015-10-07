#!/bin/sh

. ../../lib/functions.sh

bunzip2 < ../../source/SUNWfirefox37_supports_FlashPlugin__OpenSolaris_snv_130_i386.pkg.bz2 > SUNWfirefox37_supports_FlashPlugin__OpenSolaris_snv_130_i386.pkg
mkdir -p root/var/sadm/install
pkgadd -R $PWD/root/ -d SUNWfirefox37_supports_FlashPlugin__OpenSolaris_snv_130_i386.pkg all
rm -r root/var/
cp manifest.head manifest
pkgsend generate root/ | sed -e 's|^file |file root/|g' -e 's|^dir group=bin mode=0755 owner=root path=usr$|dir group=sys mode=0755 owner=root path=usr|g' -e 's|^dir group=bin mode=0755 owner=root path=usr/share$|dir group=sys mode=0755 owner=root path=usr/share|g' -e 's|^dir group=bin mode=0755 owner=root path=usr/share/applications$|dir group=other mode=0755 owner=root path=usr/share/applications|g' >> manifest

publish_pkg
