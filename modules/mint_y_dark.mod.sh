: "${XDG_DATA_HOME:=$HOME/.local/share}"
DATA_DIR="${XDG_DATA_HOME#$HOME/}"

mint_y_dark_add() {
	mkdir -p "$DATA_DIR/themes"
	cd "$DATA_DIR/themes"
	printf "mint_y_dark: extracting theme"
	tar xf Mint-Y-Dark.tar.gz
	rm Mint-Y-Dark.tar.gz
}

mint_y_dark_remove() {
	rm -rf "$DATA_DIR/themes/Mint-Y-Dark"
}

mint_y_dark_info() {
	printf "This module installs the Mint-Y-Dark theme.\n"
}

mint_y_dark_dirs() {
	printf "$DATA_DIR/themes"
}

mint_y_dark_files() {
	printf "$DATA_DIR/themes/Mint-Y-Dark.tar.gz"
}
