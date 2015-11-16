#!/bin/sh
zfs create rpool/zone1
zfs set mountpoint=/zones/zone1 rpool/zone1
chmod 700 /zones/zone1
zonecfg -z zone1 -f zone1.cfg
zoneadm -z zone1 install
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /zones/zone1/root/etc/ssh/sshd_config
for i in `pkg -R /zones/zone1/root/ publisher -H| awk '{print $1}'|grep -v "^openindiana.org$"`; do pkg -R /zones/zone1/root/ unset-publisher $i; done
mkdir /zones/zone1/root/export/repo
mkdir /zones/zone1/root/export/repo_cryptos
zoneadm -z zone1 boot
mount -F lofs /export/repo/ /zones/zone1/root/export/repo/
mount -F lofs /export/repo_cryptos/ /zones/zone1/root/export/repo_cryptos/
zlogin -C zone1
