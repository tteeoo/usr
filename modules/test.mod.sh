# test module

test_add() {
	printf "creating \$HOME/test\n"
	touch "$HOME/test"
}

test_remove() {
	printf "removing \$HOME/test\n"
	rm "$HOME/test"
}

test_info() {
	printf "information about the test module\n"
}
