# test module

test_add() {
	printf "test: linking \$HOME/.test\n"
	ln -sf "$USR_DIR/home/.test" "$HOME/.test"
	printf "test: linking \$HOME/.test-dir\n"
	ln -sf "$USR_DIR/home/.test-dir" "$HOME/.test-dir"
}

test_remove() {
	printf "test: removing \$HOME/.test\n"
	rm "$HOME/.test"
	printf "test: removing \$HOME/.test-dir\n"
	rm "$HOME/.test-dir"
}

test_info() {
	printf "This module exists for testing purposes.\nIt links a file (.test) into your home directory, and a directory (.test-dir),\nwhich has some content in it (1 and 2).\n"
}

test_dirs() {
	printf ".test-dir\n"
}

test_files() {
	printf ".test\n.test-dir/1\n.test-dir/2"
}
