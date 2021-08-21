theo_apt_add() {
	printf "theo_apt: installing packages\n"
	sudo apt install libxinerama-dev libxft-dev libfontconfig-dev make gcc \
		neovim vim curl wget git dunst npm sxiv lxpolkit fish xwallpaper picom sxhkd maim \
		xinit fzf pcmanfm zathura tmux newsboat mpv pulseaudio pulsemixer gpgconf gpg-agent \
		alsa-utils papirus-icon-theme ipython3 firefox-esr fonts-firacode cargo fonts-ubuntu \
		bsdmainutils amfora lynx xclip debsecan irssi
}

theo_apt_remove() {
	printf "Nothing to do"
}

theo_apt_info() {
	printf "Installs a set of packages with apt that I (theo) like to have on most of my systems."
}

theo_apt_dirs() {
	printf ""
}


theo_apt_files() {
	printf ""
}
