# add directories to path
export PATH="$PATH:$HOME/dev/deno/bin:$HOME/dev/scripts:$HOME/.local/bin:$HOME/dev/go/bin:$HOME/dev/cargo/bin"

# set some default programs
export SHELL=/usr/bin/fish
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export BROWSER=/usr/bin/firefox
export READER=/usr/bin/zathura

# set custom gopath
export GOPATH=$HOME/dev/go

# clean up ~
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
export SEST_DIR="$XDG_DATA_HOME/sest"
export LESSHISTFILE="-"
export HISTFILE="$XDG_CACHE_HOME/bash_history"
export CARGO_HOME="$HOME/dev/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/rc.py"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RANDFILE="$XDG_DATA_HOME/rnd"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export DENO_DIR="$XDG_CACHE_HOME/deno"
export DENO_INSTALL_ROOT="$HOME/dev/deno/bin"
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode

# things for mitchweaver/subs
export SUBS_FILE="$HOME/media/documents/subs"
export SUBS_MENU_PROG="fzf --no-sort -e --color=16"

# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] ; then

	## test for an existing bus daemon, just to be safe
	if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] ; then
		## if not found, launch a new one
		eval `dbus-launch --sh-syntax`
		echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
	fi 

	if [[ $(tty) = /dev/tty1 ]] ; then
		sudo cm-rgb-cli set logo --color='#'ffffff --brightness=10 ring --color='#'ffffff --mode=swirl --speed=2 --brightness=10
		sudo msi-rgb 000000 000000 000000 -x
		exec startx
	fi
fi
