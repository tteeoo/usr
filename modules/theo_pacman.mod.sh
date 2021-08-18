theo_pacman_add() {
	printf "theo_pacman: installing packages\n"
	sudo pacman -S --needed --noconfirm --quiet libxinerama libxft libx11 freetype2 make gcc \
		neovim vim curl wget git dunst npm sxiv lxpolkit xorg fish xwallpaper picom sxhkd \
		xorg-xinit fzf pcmanfm zathura zathura-pdf-mupdf tmux newsboat mpv pulsemixer \
		alsa-utils papirus-icon-theme ipython3 maim firefox ttf-fira-code
}

theo_pacman_remove() {
	printf "Nothing to do"
}

theo_pacman_info() {
	printf "Installs a set of packages with pacman that I (theo) like to have on most of my systems."
}

theo_pacman_dirs() {
	printf ""
}


theo_pacman_files() {
	printf ""
}
