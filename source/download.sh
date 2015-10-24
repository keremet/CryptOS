#!/bin/sh
cashed_download(){
	if [ -z $2 ]
	then FILENAME=`basename $1`
	else FILENAME=$2
	fi

	if ! [ -f $FILENAME ]; then
		curl -k -L $1 > $FILENAME
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

#libgstflump3dec
cashed_download https://launchpad.net/gst-fluendo-mp3/trunk/0.10.32/+download/gst-fluendo-mp3-0.10.32.tar.bz2

#firefox31
cashed_download http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/31.0/contrib/solaris_pkgadd/firefox-31.0.en-US.opensolaris-i386-pkg.bz2

#firefox37
cashed_download http://opensxce.org/.FF/37/i386/SUNWfirefox37_supports_FlashPlugin__OpenSolaris_snv_130_i386.pkg.bz2

#openoffice
cashed_download http://www.openfoundry.org/of/download_path/osscd/3.4.0m1_Rev1227012/OOo_3.4.0_Solaris_x86_install_ru.tar.gz

#gpa
cashed_download ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.19.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-2.2.1.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-1.5.5.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/gpa/gpa-0.9.7.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.6.3.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/libksba/libksba-1.3.3.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/npth/npth-1.2.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-2.1.6.tar.bz2
cashed_download ftp://ftp.gnupg.org/gcrypt/pinentry/pinentry-0.9.5.tar.bz2

#ntfs-3g
cashed_download https://www.tuxera.com/opensource/ntfs-3g_ntfsprogs-2015.3.14.tgz

#xxkb
cashed_download http://sourceforge.net/projects/xxkb/files/xxkb-1.11.1-src.tar.gz/download xxkb-1.11.1-src.tar.gz

#gtk
cashed_download http://cairographics.org/releases/cairo-1.14.2.tar.xz
cashed_download http://cairographics.org/releases/pixman-0.32.6.tar.gz

