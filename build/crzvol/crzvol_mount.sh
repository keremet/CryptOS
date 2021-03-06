#!/bin/sh
sudo lofiadm1 -c aes-256-cbc -a /dev/zvol/rdsk/rpool/d /dev/lofi/1
if [ "$?" != "0" ]
then echo "Ошибка lofiadm. Нажмите Enter для продолжения"
 read
 exit 1
fi

sudo zpool import -d /dev/lofi data
if [ "$?" != "0" ]
then echo "Ошибка zpool. Нажмите Enter для продолжения"
 read
 exit 1
fi

gnome-commander --start-left-dir=/data
