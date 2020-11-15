# theo_dirs module

: "${XDG_CACHE_HOME:=$HOME/.cache}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"

theo_dirs_add() {
	printf "theo_dirs: creating directories\n"
	mkdir -p "$HOME"/av/wall
	mkdir -p "$HOME"/av/scrot
	mkdir -p "$HOME"/docs
	mkdir -p "$HOME"/src/git/aur
	mkdir -p "$HOME"/src/git/ghw
	mkdir -p "$HOME"/src/git/ghf
	mkdir -p "$HOME"/src/git/ghf
	mkdir -p "$XDG_DATA_HOME"/pub
	printf "theo_dirs: copying some wallpapers\n"
	cp "$USR_DIR"/home/av/wall/bg1.jpg "$HOME"/av/wall/bg1.jpg
	cp "$USR_DIR"/home/av/wall/bg2.jpg "$HOME"/av/wall/bg2.jpg
}

theo_dirs_remove() {
	printf "theo_dirs: removing directories\n"
	rmdir "$HOME"/av/wall
	rmdir "$HOME"/av/scrot
	rmdir "$HOME"/av
	rmdir "$HOME"/docs
	rmdir "$HOME"/src/git/aur
	rmdir "$HOME"/src/git/ghw
	rmdir "$HOME"/src/git/ghf
	rmdir "$HOME"/src/git
	rmdir "$HOME"/src
	rmdir "$XDG_DATA_HOME"/pub
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
