#!/bin/sh
# startx
# start picom, dwmblocks, set wallpaper and run dwm:

set_wallpaper & dwmblocks & picom &

exec dwm # or startxfce4 for xfce
