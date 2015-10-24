#!/bin/sh
/usr/bin/setxkbmap -option "grp:ctrl_shift_toggle,grp_led:scroll" -layout "us,ru"
exec /usr/bin/xxkb
