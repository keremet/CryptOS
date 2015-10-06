#!/bin/sh

. ../../lib/functions.sh

pkg install pkg:/developer/gcc-3 pkg:/system/library/math/header-math pkg:/developer/gnome/gettext pkg:/library/desktop/gtk2 

#tar xf ../../source/libgpg-error-1.19.tar.bz2 
#cd libgpg-error-1.19

export BIN_DIR=/usr/local/gpa
export COMPILATION_DIR=$PWD


norm_install(){
	cd $COMPILATION_DIR
	DIRNAME=`basename $1 .tar.bz2`
	rm -rf $DIRNAME
	tar xf ../../source/$1
	if [ $? -ne 0 ]; then
		echo "Ошибка распаковки файла $1"
		exit 1
	fi
	cd $DIRNAME
	if [ $? -ne 0 ]; then
		echo "Ошибка перехода в каталог $DIRNAME"
		exit 1
	fi


	shift
	./configure --prefix=$BIN_DIR $@
	if [ $? -ne 0 ]; then
		echo "Ошибка конфигурирования $DIRNAME"
		exit 1
	fi
	make_all
	if [ $? -ne 0 ]; then
		echo "Ошибка компиляции $DIRNAME"
		exit 1
	fi
	make install
	if [ $? -ne 0 ]; then
		echo "Ошибка установки $DIRNAME"
		exit 1
	fi
} 


export CFLAGS="-O3" 
norm_install libgpg-error-1.19.tar.bz2
norm_install libassuan-2.2.1.tar.bz2 --with-libgpg-error-prefix=$BIN_DIR
norm_install gpgme-1.5.5.tar.bz2 --with-libgpg-error-prefix=$BIN_DIR --with-libassuan-prefix=$BIN_DIR
norm_install gpa-0.9.7.tar.bz2 --with-gpg-error-prefix=$BIN_DIR --with-libassuan-prefix=$BIN_DIR --with-gpgme-prefix=$BIN_DIR LDFLAGS="-lnsl"
norm_install libgcrypt-1.6.3.tar.bz2 --with-gpg-error-prefix=$BIN_DIR
norm_install libksba-1.3.3.tar.bz2 --with-gpg-error-prefix=$BIN_DIR
export CFLAGS="-O3 -std=c99"
norm_install npth-1.2.tar.bz2
export CFLAGS="-O3"
export LD_LIBRARY_PATH=$BIN_DIR/lib
norm_install gnupg-2.1.6.tar.bz2 --with-gpg-error-prefix=$BIN_DIR --with-libassuan-prefix=$BIN_DIR --with-libgcrypt-prefix=$BIN_DIR --with-ksba-prefix=$BIN_DIR --with-npth-prefix=$BIN_DIR --disable-ldap --disable-dirmngr LDFLAGS="-lsocket"
export CFLAGS="-O3 -DGDK_KEY_Escape=GDK_Escape"
norm_install pinentry-0.9.5.tar.bz2 --with-libgpg-error-prefix=$BIN_DIR --with-libassuan-prefix=$BIN_DIR

cd $COMPILATION_DIR

publish_pkg
