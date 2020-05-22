xrandr --output HDMI-A-0 --set underscan on
xrandr --output HDMI-A-0 --set "underscan hborder" 100 --set "underscan vborder" 60
feh --bg-scale $(find /home/theo/media/images/wall -type f -name "*" | shuf -n 1)
dunst &
sxhkd &
picom -b --config /home/theo/.config/picom/picom.conf &
spectrwm
