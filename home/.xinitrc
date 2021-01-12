#!/bin/sh
# configure monitors (system dependent)

runif() {
	if which "$1" > /dev/null 2>&1 ; then
		$@ &
	fi
}

# configure x
if [ "$(hostname)" = "art" ] ; then
	xrandr --output DP-3 --primary --mode 1920x1080 --pos 0x840 --rotate normal \
		--output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left --gamma 0.86
fi
xrdb -load "$XDG_CONFIG_HOME/X11/Xresources"
setxkbmap -option caps:swapescape
setxkbmap -option compose:ralt

# set wallpaper
runif randwall

# start hotkey daemon, notification daemon, spotify daemon, and compositor
runif sxhkd
runif dunst
runif spotifyd
if which picom > /dev/null 2>&1 ; then
	picom -b --config "$XDG_CONFIG_HOME/picom/picom.conf"
else
	runif compton --config "$XDG_CONFIG_HOME/picom/picom.conf"
fi

# fix java apps with non-reparenting wms
export _JAVA_AWT_WM_NONREPARENTING=1

# start window manager
runif dwmblocks
runif lxpolkit

exec dwm
