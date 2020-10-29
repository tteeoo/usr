# base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export BIN="$HOME/.local/bin"
export MEDIA="$HOME"
export SCRIPTS="$HOME/src/git/scripts" # system dependent

# set some default programs
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export BROWSER=/usr/bin/firefox
export READER=/usr/bin/zathura

# set custom gopath
export GOPATH="$XDG_DATA_HOME/go"

# clean up ~
export SEST_DIR="$XDG_DATA_HOME/sest"
export LESSHISTFILE="-"
export HISTFILE="$XDG_CACHE_HOME/bash_history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/rc.py"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RANDFILE="$XDG_DATA_HOME/rnd"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export DENO_DIR="$XDG_DATA_HOME/deno"
export DENO_INSTALL_ROOT="$XDG_DATA_HOME/deno/bin"
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache.config"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# things for mitchweaver/subs
export SUBS_FILE="$MEDIA/docs/subs"
export SUBS_MENU_PROG="fzf --no-sort -e --color=16"

# add directories to path
export PATH="$PATH:$BIN:$SCRIPTS:$CARGO_HOME/bin:$GOPATH/bin:$DENO_INSTALL_ROOT"

# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] ; then

	## test for an existing bus daemon, just to be safe
	if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] ; then
		## if not found, launch a new one
		eval `dbus-launch --sh-syntax`
		echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
	fi 
	
	# system dependent
	if [[ $(tty) = /dev/tty1 ]] ; then
		sudo cm-rgb-cli set logo --color='#'ffffff --brightness=10 ring --color='#'ffffff --brightness=10
		sudo msi-rgb 000000 000000 000000 -x
		exec startx
	fi
fi
