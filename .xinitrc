#!/bin/sh
sxhkd &
"$HOME"/.fehbg &
while : ; do
	xsetroot -name "$(genstatus)"
	sleep 2
done &
exec dwm
