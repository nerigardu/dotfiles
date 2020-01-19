#!/bin/sh
sxhkd &
"$HOME"/.fehbg &
while : ; do
	xsetroot -name "$(genstatus)"
	sleep 30
done &
exec dwm
