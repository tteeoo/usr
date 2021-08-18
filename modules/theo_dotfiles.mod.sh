: "${XDG_DATA_HOME:=$HOME/.local/share}"
DATA_DIR="${XDG_DATA_HOME#$HOME/}"

: "${XDG_CONFIG_HOME:=$HOME/.config}"
CONFIG_DIR="${XDG_CONFIG_HOME#$HOME/}"

theo_dotfiles_add() {
	for DIR in $(theo_dotfiles_dirs) ; do
		if ! [ -d "$HOME/$DIR" ] ; then 
			mkdir -p "$HOME/$DIR"
			printf "theo_dotfiles: making directory %s/%s\n" "$HOME" "$DIR"
		fi
	done
	chmod 700 "$HOME/$DATA_DIR/gnupg"

	for FILE in $(theo_dotfiles_files) ; do
		[ -f "$HOME/$FILE" ] && mv "$HOME/$FILE" "$HOME/$FILE".orig && \
			printf "theo_dotfiles: moving %s/%s to %s/%s.orig\n" "$HOME" "$FILE" "$HOME" "$FILE"
		ln -sf "$USR_DIR/home/$FILE" "$HOME/$FILE" && \
			printf "theo_dotfiles: linking %s/home/%s to %s/%s\n" "$USR_DIR" "$FILE" "$HOME" "$FILE"
	done
	printf "theo_dotfiles: extracting firefox profile\n"
	cd "$HOME/.mozilla/firefox" || return
	tar xf custom-profile.tar.gz
	printf "theo_dotfiles: extracting theme\n"
	cd "$HOME/$DATA_DIR/themes" || return
	tar xf Mint-Y-Dark.tar.gz
}

theo_dotfiles_remove() {
	for FILE in $(theo_dotfiles_files) ; do
		rm "$HOME/$FILE" && \
			printf "theo_dotfiles: removing %s/%s\n" "$HOME" "$FILE"
		[ -f "$HOME/$FILE".orig ] && mv "$HOME/$FILE".orig "$HOME/$FILE" && \
			printf "theo_dotfiles: moving %s/%s.orig to %s/%s\n" "$HOME" "$FILE" "$HOME" "$FILE"
	done
	rm -rf "$HOME/.mozilla/firefox/custom-profile"
	rm -rf "$HOME/$DATA_DIR/themes"
}

theo_dotfiles_info() {
	printf "This module contains my (theo's) dotfiles.\n"
}

theo_dotfiles_dirs() {
	printf "$DATA_DIR/wineprefixes $CONFIG_DIR/discocss $CONFIG_DIR/fish
		$CONFIG_DIR/newsboat $CONFIG_DIR/gtk-3.0
		$CONFIG_DIR/gtk-2.0 $CONFIG_DIR/python $CONFIG_DIR/picom $CONFIG_DIR/sxhkd
		$CONFIG_DIR/dunst $CONFIG_DIR/nvim $CONFIG_DIR/rco $CONFIG_DIR/git
		$CONFIG_DIR/mpv $CONFIG_DIR/npm $CONFIG_DIR/X11 $CONFIG_DIR/tmux .vim
		$DATA_DIR/gnupg .mozilla/firefox $DATA_DIR/themes"
}

theo_dotfiles_files() {
	printf ".profile .bashrc .xinitrc .vim/vimrc .bash_profile $CONFIG_DIR/wgetrc
		$CONFIG_DIR/npm/npmrc $CONFIG_DIR/git/config $CONFIG_DIR/mpv/mpv.conf
		$CONFIG_DIR/python/rc.py $CONFIG_DIR/sxhkd/sxhkdrc $CONFIG_DIR/dunst/dunstrc
		$CONFIG_DIR/nvim/init.vim $CONFIG_DIR/X11/Xresources $CONFIG_DIR/mpv/input.conf
		$CONFIG_DIR/newsboat/config $CONFIG_DIR/rco/config.csv $CONFIG_DIR/rco/objects.csv
		$CONFIG_DIR/picom/picom.conf $CONFIG_DIR/fish/config.fish $CONFIG_DIR/gtk-2.0/gtkrc-2.0
		$CONFIG_DIR/fish/fish_variables $CONFIG_DIR/gtk-3.0/settings.ini
		$CONFIG_DIR/nvim/coc-settings.json $CONFIG_DIR/discocss/custom.css
		$CONFIG_DIR/user-dirs.dirs $CONFIG_DIR/tmux/tmux.conf
		$DATA_DIR/gnupg/sshcontrol $DATA_DIR/gnupg/gpg-agent.conf $CONFIG_DIR/newsboat/urls
		.mozilla/firefox/custom-profile.tar.gz $DATA_DIR/themes/Mint-Y-Dark.tar.gz"
}
