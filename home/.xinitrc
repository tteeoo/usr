#!/bin/sh
# configure monitors (system dependent)
xrandr --output DP-3 --primary --mode 1920x1080 --pos 0x840 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left --gamma 0.86

xrdb -load $XDG_CONFIG_HOME/X11/Xresources

# set wallpaper
randwall

# start hotkey daemon, notification daemon, spotify daemon, and compositor
sxhkd &
dunst &
spotifyd
picom -b --config $XDG_CONFIG_HOME/picom/picom.conf

# fix java apps with non-reparenting wms
export _JAVA_AWT_WM_NONREPARENTING=1

# start window manager
dwmblocks &
lxpolkit &
setxkbmap -option caps:swapescape
setxkbmap -option compose:ralt
exec dwm
