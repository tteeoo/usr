# configure monitors
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --primary --mode 1920x1080 --pos 0x840 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DVI-D-0 --off --output HDMI-A-0 --gamma 0.86

# set wallpaper
/home/theo/dev/scripts/randwall

# start hotkey daemon, notification daemon, spotify daemon, and compositor
sxhkd &
dunst &
spotifyd
picom -b --config /home/theo/.config/picom/picom.conf &

# start window manager
dwmblocks &
dwm
