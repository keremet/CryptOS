#!/bin/sh
cashed_download(){
	FILENAME=`basename $1`
	if ! [ -f $FILENAME ]; then
		curl -L $1 > $FILENAME
		if [ $? -ne 0 ]; then
			echo "Ошибка скачивания файла $1"
			exit 1
		fi
	fi
}

#unrar
cashed_download http://www.rarlab.com/rar/unrarsrc-5.3.2.tar.gz

#gcc
cashed_download http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.bz2
cashed_download http://ftp.gnu.org/gnu/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2
cashed_download ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2
cashed_download ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
cashed_download ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
cashed_download ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.14.tar.bz2

#xmms
cashed_download http://www.xmms.org/files/1.2.x/xmms-1.2.11.tar.bz2

#firefox31
cashed_download http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/31.0/contrib/solaris_pkgadd/firefox-31.0.en-US.opensolaris-i386-pkg.bz2

#openoffice
cashed_download http://www.openfoundry.org/of/download_path/osscd/3.4.0m1_Rev1227012/OOo_3.4.0_Solaris_x86_install_ru.tar.gz

#gtk
cashed_download http://cairographics.org/releases/cairo-1.14.2.tar.xz
cashed_download http://cairographics.org/releases/pixman-0.32.6.tar.gz

