source "$HOME"/.profile

if [[ -z $DISPLAY ]] ; then

	# test for an existing bus daemon, just to be safe
	if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] ; then
		# if not found, launch a new one
		eval "$(dbus-launch --sh-syntax)"
		echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
	fi 
	
	# system dependent
	# startx if in tty1 also sets my PCs RGB (epic gamer)
	if [[ $(tty) = /dev/tty1 ]] ; then
		sudo cm-rgb-cli set logo --color='#ffffff' --brightness=10 ring --color='#ffffff' --brightness=10
		sudo msi-rgb 000000 000000 000000 -x
		exec startx
	fi
fi

source "$HOME"/.bashrc
