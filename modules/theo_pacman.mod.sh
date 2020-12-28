theo_pacman_add() {
	printf "theo_pacman: installing packages\n"
	sudo pacman -S --needed --noconfirm --quiet libxinerama libxft libx11 freetype2 make gcc \
		neovim vim curl wget git dunst npm sxiv lxpolkit xorg fish xwallpaper picom sxhkd \
		xorg-xinit lxsession
}

theo_pacman_remove() {
}

theo_pacman_info() {
	printf "Installs a set of packages with pacman that I (theo) like to have on most of my systems."
}

theo_pacman_dirs() {
}


theo_pacman_files() {
}
