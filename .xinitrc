# configure monitors
xrandr --output DisplayPort-2 --primary --mode 1920x1080 --pos 0x840 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate left --gamma 0.86
xrdb -merge ~/.config/X11/Xresources

# set wallpaper
/home/theo/dev/scripts/randwall

# start hotkey daemon, notification daemon, spotify daemon, and compositor
sxhkd &
dunst &
spotifyd
picom -b --config /home/theo/.config/picom/picom.conf &

# start window manager
dwmblocks &
exec dwm
