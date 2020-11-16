# base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# these are used in ~/.config/user-dirs.dirs to set locations
export XDG_DESKTOP_DIR="/home/theo"
export XDG_DOCUMENTS_DIR="/home/theo/docs"
export XDG_DOWNLOAD_DIR="/home/theo"
export XDG_MUSIC_DIR="/home/theo/av"
export XDG_PICTURES_DIR="/home/theo/av"
export XDG_PUBLICSHARE_DIR="/home/theo/docs/pub"
export XDG_TEMPLATES_DIR="/home/theo/docs/templates"
export XDG_VIDEOS_DIR="/home/theo/av"

# more envs
export BIN="$HOME/.local/bin"
export OPT_BIN="$BIN/opt"
export GOPATH="$XDG_DATA_HOME/go"

# set some default programs
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export TERMINAL="$BIN/st"
export BROWSER=/usr/bin/firefox
export READER=/usr/bin/zathura

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
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# things for mitchweaver/subs
export SUBS_FILE="$XDG_DOCUMENTS_DIR/subs.list"
export SUBS_MENU_PROG="fzf --no-sort -e --color=16"

# add directories to path
export PATH="$OPT_BIN:$BIN:$GOPATH/bin:$CARGO_HOME/bin:$DENO_INSTALL_ROOT:$PATH"
