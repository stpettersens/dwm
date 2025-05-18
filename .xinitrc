#!/bin/sh
# startx
# start picom, dwmblocks, set wallpaper and run dwm:

set_wallpaper & dwmblocks & picom & ulauncher & ulauncher-toggle

exec dwm # or startxfce4 for xfce
