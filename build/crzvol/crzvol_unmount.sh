#!/bin/sh
sudo zpool export data 
if [ "$?" != "0" ]
then echo "Нажмите Enter для продолжения"
 read
fi

sudo lofiadm -d /dev/lofi/1
if [ "$?" != "0" ]
then echo "Нажмите Enter для продолжения"
 read
fi
