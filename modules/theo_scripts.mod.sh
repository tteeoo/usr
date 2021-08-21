theo_scripts_add() {
	printf "theo_scripts: making directories\n"
	mkdir -p "$HOME/.local/bin"
	printf "theo_scripts: chmoding and linking scripts\n"
	for script in $(theo_scripts_files) ; do
		chmod +x "$USR_DIR/home/$script"
		ln -sf "$USR_DIR/home/$script" "$HOME/$script"
	done
}

theo_scripts_remove() {
	printf "theo_scripts: removing scripts\n"
	for script in $(theo_scripts_files) ; do
		rm "$HOME/$script"
	done
}

theo_scripts_info() {
	printf "Contains some scripts I (theo) made and use.\n"
}

theo_scripts_dirs() {
	printf ""
}

theo_scripts_files() {
	printf ".local/bin/autorss .local/bin/cpusage
		.local/bin/git_status_prompt .local/bin/lock .local/bin/lsearch
		.local/bin/openup .local/bin/randwall .local/bin/runt
		.local/bin/spt-mute.sh .local/bin/spt-vol.sh .local/bin/time_bar
		.local/bin/volume_bar .local/bin/range .local/bin/tku
		.local/bin/snap .local/bin/delsnap"
}
