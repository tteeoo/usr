theo_pacman_add() {
	printf "theo_apt: installing packages\n"
	sudo pacman -S --needed --noconfirm --quiet libxinerama-dev libxft-dev libfontconfig-dev make gcc \
		neovim vim curl wget git dunst npm sxiv lxpolkit fish xwallpaper picom sxhkd maim \
		xinit fzf pcmanfm zathura tmux newsboat mpv pulseaudio pulsemixer gpgconf gpg-agent \
		alsa-utils papirus-icon-theme ipython3 firefox-esr fonts-firacode
}

theo_pacman_remove() {
	printf "Nothing to do"
}

theo_pacman_info() {
	printf "Installs a set of packages with apt that I (theo) like to have on most of my systems."
}

theo_pacman_dirs() {
	printf ""
}


theo_pacman_files() {
	printf ""
}
