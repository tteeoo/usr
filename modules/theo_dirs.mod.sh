theo_dirs_add() {
	printf "theo_dirs: creating directories\n"
	mkdir -p "$HOME"/av/wall
	mkdir -p "$HOME"/av/scrot
	mkdir -p "$HOME"/docs/templates
	mkdir -p "$HOME"/docs/pub
	mkdir -p "$HOME"/docs
	mkdir -p "$HOME"/src/git/aur
	mkdir -p "$HOME"/src/git/ghw
	mkdir -p "$HOME"/src/git/ghf
	mkdir -p "$HOME"/.local/share
	mkdir -p "$HOME"/.config
	printf "theo_dirs: copying some wallpapers\n"
	cp --remove-destination "$USR_DIR"/home/av/wall/bg1.jpg "$HOME"/av/wall/bg1.jpg
	cp --remove-destination "$USR_DIR"/home/av/wall/bg2.jpg "$HOME"/av/wall/bg2.jpg
}

theo_dirs_remove() {
	printf "theo_dirs: removing directories\n"
	rmdir "$HOME"/av/wall
	rmdir "$HOME"/av/scrot
	rmdir "$HOME"/av
	rmdir "$HOME"/docs/templates
	rmdir "$HOME"/docs/pub
	rmdir "$HOME"/docs
	rmdir "$HOME"/src/git/aur
	rmdir "$HOME"/src/git/ghw
	rmdir "$HOME"/src/git/ghf
	rmdir "$HOME"/src/git
	rmdir "$HOME"/src
	rmdir "$HOME"/.local/bin
	rmdir "$HOME"/.local/share
	rmdir "$HOME/.local"
	rmdir "$HOME"/.config
}

theo_dirs_info() {
	printf "Creates directories I (theo) like to have in ~.\n"
}

theo_dirs_dirs() {
	printf "av/wall"
}

theo_dirs_files() {
	printf "av/wall/bg1.jpg av/wall/bg2.jpg"
}
