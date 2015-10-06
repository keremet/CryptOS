#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3 pkg:/system/library/math/header-math pkg:/developer/gnome/gettext pkg:/library/audio/gstreamer

tar xf ../../source/gst-fluendo-mp3-0.10.32.tar.bz2 
cd gst-fluendo-mp3-0.10.32/
CFLAGS="-O3" ./configure
make_all

cd ..

publish_pkg
