#!/bin/sh
# startx
# start picom, dwmblocks, set wallpaper and run dwm:

set_wallpaper & dwmblocks & picom & start-ulauncher &

exec dwm
