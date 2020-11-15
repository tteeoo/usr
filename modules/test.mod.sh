# test module

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

test_dirs() {
	printf ".test-dir\n"
}

test_files() {
	printf ".test\n.test-dir/1\n.test-dir/2"
}
