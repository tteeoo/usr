: "${XDG_CONFIG_HOME:=$HOME/.config}"
CONFIG_DIR="${XDG_CONFIG_HOME#$HOME/}"

spotifyd_ver="v0.3.2"
spotify_tui_ver="v0.24.0"

theo_spotify_add() {
	for DIR in $(theo_spotify_dirs) ; do
		if ! [ -d "$HOME/$DIR" ] ; then 
			mkdir -p "$HOME/$DIR"
			printf "theo_spotify: making directory %s/%s\n" "$HOME" "$DIR"
		fi
	done

	for FILE in $(theo_spotify_files) ; do
		[ -f "$HOME/$FILE" ] && mv "$HOME/$FILE" "$HOME/$FILE".orig && \
			printf "theo_spotify: moving %s/%s to %s/%s.orig\n" "$HOME" "$FILE" "$HOME" "$FILE"
		ln -sf "$USR_DIR/home/$FILE" "$HOME/$FILE" && \
			printf "theo_spotify: linking %s/home/%s to %s/%s\n" "$USR_DIR" "$FILE" "$HOME" "$FILE"
	done

	printf "theo_spotify: downloading tarballs\n"
	wget "https://github.com/Spotifyd/spotifyd/releases/download/$spotifyd_ver/spotifyd-linux-default.tar.gz" \
		"https://github.com/Rigellute/spotify-tui/releases/download/$spotify_tui_ver/spotify-tui-linux.tar.gz"
	printf "theo_spotify: extracting tarballs\n"
	tar xf spotifyd-linux-default.tar.gz
	tar xf spotify-tui-linux.tar.gz
	printf "theo_spotify: installing binaries\n"
	mkdir -p "$HOME/.local/bin"
	mv spotifyd "$HOME/.local/bin/"
	mv spt "$HOME/.local/bin/"
	rm spotifyd-linux-default.tar.gz
	rm spotify-tui-linux.tar.gz
}

theo_spotify_remove() {
	for FILE in $(theo_spotify_files) ; do
		rm "$HOME/$FILE" && \
			printf "theo_spotify: removing %s/%s\n" "$HOME" "$FILE"
		[ -f "$HOME/$FILE".orig ] && mv "$HOME/$FILE".orig "$HOME/$FILE" && \
			printf "theo_spotify: moving %s/%s.orig to %s/%s\n" "$HOME" "$FILE" "$HOME" "$FILE"
	done
	rm "$HOME/.local/bin/spotifyd"
	rm "$HOME/.local/bin/spt"
}

theo_spotify_info() {
	printf "This module contains my (theo's) spotifyd and spotify-tui configs and installs the programs.\n"
}

theo_spotify_dirs() {
	printf "$CONFIG_DIR/spotifyd $CONFIG_DIR/spotify-tui"
}

theo_spotify_files() {
	printf "$CONFIG_DIR/spotifyd/spotifyd.conf
		$CONFIG_DIR/spotify-tui/config.yml"
}
