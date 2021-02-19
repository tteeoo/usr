# functions

runif() {
	if which "$1" > /dev/null 2>&1 ; then
		$@ &
	fi
}

# base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# these are the values used in ~/.config/user-dirs.dirs to set locations
# put here for clarity
export XDG_DESKTOP_DIR="/home/theo"
export XDG_DOCUMENTS_DIR="/home/theo/docs"
export XDG_DOWNLOAD_DIR="/home/theo"
export XDG_MUSIC_DIR="/home/theo/av"
export XDG_PICTURES_DIR="/home/theo/av"
export XDG_PUBLICSHARE_DIR="/home/theo/docs/pub"
export XDG_TEMPLATES_DIR="/home/theo/docs/templates"
export XDG_VIDEOS_DIR="/home/theo/av"

# more envs
export LOCAL_BIN="$HOME/.local/bin"
export GOPATH="$XDG_DATA_HOME/go"
export VIMWIKI="$XDG_DOCUMENTS_DIR/vimwiki"

# set some default programs
if which nvim > /dev/null 2>&1 ; then
	export VISUAL="$(which nvim)"
	export EDITOR="$(which nvim)"
else
	export VISUAL="$(which vim)"
	export EDITOR="$(which vim)"
fi

if which brave > /dev/null 2>&1 ; then
	export BROWSER="$(which brave)"
else
	export BROWSER="$(which firefox)"
fi

if which st > /dev/null 2>&1 ; then
	export TERMINAL="$LOCAL_BIN/st"
else
	if which alacritty > /dev/null 2>&1 ; then
		export TERMINAL="$(which alacritty)"
	fi
fi

if which zathura > /dev/null 2>&1 ; then
	export READER="$(which zathura)"
fi

if which ipython3 > /dev/null 2>&1 ; then
	export INTPY="$(which ipython3)"
else
	export INTPY="$(which python3)"
fi

# clean up ~
export IPFS_PATH="$XDG_DATA_HOME/ipfs"
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
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# things for mitchweaver/subs
export SUBS_FILE="$XDG_DOCUMENTS_DIR/subs.list"
export SUBS_MENU_PROG="fzf --no-sort -e --color=16"

# add directories to path
export PATH="$LOCAL_BIN:$GOPATH/bin:$CARGO_HOME/bin:$DENO_INSTALL_ROOT:$PATH"
