# fix my secondary monitor (comment this out if you are not me)
xrandr --output HDMI-A-0 --set underscan on
xrandr --output HDMI-A-0 --set "underscan hborder" 100 --set "underscan vborder" 60

# set wallpaper
feh --bg-scale $(find /home/theo/media/images/wall -type f -name "*" | shuf -n 1)

# start hotkey daemon, notification daemon, spotify daemon, and compositor
sxhkd &
dunst &
spotifyd --no-daemon &
picom -b --config /home/theo/.config/picom/picom.conf &

# start window manager
dwmblocks &
exec dwm
