#!/bin/sh
sxhkd &
"$HOME"/.fehbg &
while : ; do
	xsetroot -name "$(genstatus)"
	sleep 1
done &
exec dwm
