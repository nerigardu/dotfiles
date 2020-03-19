#!/bin/sh
"$HOME"/.fehbg &
setxkbmap -option "ctrl:nocaps"
sxhkd &
xsetroot -cursor_name "left_ptr" &
#while : ; do
#	xsetroot -name "$(genstatus)"
#	sleep 1
#done &
exec 2bwm
