# theo_scripts module

theo_scripts_add() {
	printf "theo_scripts: chmoding scripts\n"
	for SCRIPT in $(theo_scripts_files) ; do
		chmod +x "$USR_DIR/home/$SCRIPT"
	done
	printf "theo_scripts: linking %s/.local/bin/opt\n" "$HOME"
	ln -sf "$USR_DIR"/home/.local/bin/opt "$HOME"/.local/bin/opt
}

theo_scripts_remove() {
	printf "theo_scripts: removing %s/.local/bin/opt\n" "$HOME"
	rm "$HOME"/.local/bin/opt
}

theo_scripts_information() {
	printf "Contains some scripts I (theo) made and use.\n"
}

theo_scripts_dirs() {
	printf ".local/bin/opt"
}

theo_scripts_files() {
	printf ".local/bin/opt/aur .local/bin/opt/autorss .local/bin/opt/cpusage
		.local/bin/opt/git_status_prompt .local/bin/opt/lock .local/bin/opt/lsearch
		.local/bin/opt/openup .local/bin/opt/randwall .local/bin/opt/runt
		.local/bin/opt/spt-mute.sh .local/bin/opt/spt-vol.sh .local/bin/opt/time_bar
		.local/bin/opt/volume_bar"
}
