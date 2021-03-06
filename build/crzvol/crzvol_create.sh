#!/bin/sh
if [ -z "$1" ] 
then
	echo "Usage: $0 <zvol size>"
	echo "For example: $0 50G"
	exit 1
fi
sudo zfs create -V $1 rpool/d && \
sudo lofiadm -c aes-256-cbc -a /dev/zvol/rdsk/rpool/d /dev/lofi/1 && \
sudo zpool create data /dev/lofi/1 && \
sudo chmod -R a+w /data && \
sudo zfs create data/home

