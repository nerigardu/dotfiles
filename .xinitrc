#!/bin/sh
xwallpaper --daemon --zoom ~/Pictures/wallpaper/rubik_melt.jpg &
setxkbmap -option "ctrl:nocaps" &
sxhkd &
xsetroot -cursor_name "left_ptr" &
#while : ; do
#	xsetroot -name "$(genstatus)"
#	sleep 1
#done &
exec 2bwm
