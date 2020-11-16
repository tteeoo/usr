test_add() {
	printf "test: linking %s/.test\n" "$HOME"
	ln -sf "$USR_DIR/home/.test" "$HOME/.test"
	printf "test: linking %s/.test-dir\n" "$HOME"
	ln -sf "$USR_DIR/home/.test-dir" "$HOME/.test-dir"
}

test_remove() {
	printf "test: removing %s/.test\n" "$HOME"
	rm "$HOME/.test"
	printf "test: removing %s/.test-dir\n" "$HOME"
	rm "$HOME/.test-dir"
}

test_info() {
	printf "This module exists for testing purposes.\nIt links a file (.test) into your home directory, and a directory (.test-dir),\nwhich has some content in it (1 and 2).\n"
}

test_dirs() {
	printf ".test-dir"
}

test_files() {
	printf ".test .test-dir/1 .test-dir/2"
}
