source "$HOME"/.profile

if [[ -z $DISPLAY ]] ; then

	# create bus daemon if it does not exist
	if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] ; then
		touch ~/a
		eval "$(runif dbus-launch --sh-syntax)"
	fi 

	# startx if in tty1
	if [[ $(tty) = /dev/tty1 ]] ; then
		exec startx
	fi
fi

source "$HOME"/.bashrc
