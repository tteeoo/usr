rco_add() {
	printf "rco: cloning git repo\n"
	mkdir -p "$HOME"/src/git
	git clone https://github.com/tteeoo/rco "$HOME"/src/git/rco
	printf "rco: compiling and installing software\n"
	cargo install --path "$HOME"/src/git/rco
}

rco_remove() {
	printf "rco: uninstalling binary\n"
	cargo uninstall --bin rco
	printf "rco: removing repo\n"
	rm -rf "$HOME"/src/git/rco
}

rco_info() {
	printf "Installs the program 'rco' (https://github.com/tteeoo/rco)"
}

rco_dirs() {
	printf ""
}

rco_files() {
	printf ""
}
