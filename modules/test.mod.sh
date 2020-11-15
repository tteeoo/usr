# test module

test_files() {
	printf ".test\n"
}

test_add() {
	printf "linking \$HOME/.test\n"
	ln -sf "$USR_DIR/home/.test" "$HOME/.test"
}

test_remove() {
	printf "removing \$HOME/.test\n"
	rm "$HOME/.test"
}

test_info() {
	printf "this module exists for testing purposes.
it links a file (.test) into your home directory.\n"
}
