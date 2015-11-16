#!/bin/sh
zoneadm -z zone1 halt
zonecfg -z zone1 delete -F
zfs destroy -r rpool/zone1
