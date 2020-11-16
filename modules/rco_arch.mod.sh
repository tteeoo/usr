rco_arch_add() {
	printf "rco_arch: installing packages\n"
	sudo pacman -S --needed --noconfirm --quiet rust git
	printf "rco_arch: cloning git repo\n"
	mkdir -p "$HOME"/src/git
	git clone https://github.com/tteeoo/rco "$HOME"/src/git/rco
	printf "rco_arch: compiling and installing software\n"
	cargo install --path "$HOME"/src/git/rco
}

rco_arch_remove() {
	printf "rco_arch: uninstalling binary\n"
	cargo uninstall --bin rco
	printf "rco_arch: removing repo\n"
	rm -rf "$HOME"/src/git/rco
}

rco_arch_info() {
	printf "Installs the program 'rco' (https://github.com/tteeoo/rco)"
}

rco_arch_dirs() {
	printf ""
}

rco_arch_files() {
	printf ""
}
