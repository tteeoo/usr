# configure monitors
xrandr --output DP-3 --primary --mode 1920x1080 --pos 0x840 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left --gamma 0.86
xrdb -load ~/.config/X11/Xresources

# set wallpaper
/home/theo/dev/scripts/randwall

# start hotkey daemon, notification daemon, spotify daemon, and compositor
sxhkd &
dunst &
spotifyd
picom -b --config /home/theo/.config/picom/picom.conf &

# fix java apps with non-reparenting wms
export _JAVA_AWT_WM_NONREPARENTING=1

# start window manager
dwmblocks &
lxpolkit &
exec dwm
