# add directories to path
export PATH="$PATH:$HOME/.deno/bin:$HOME/dev/scripts:$HOME/.local/bin:$HOME/dev/go/bin:$HOME/.cargo/bin"

# set some default programs
export SHELL=fish
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=st
export BROWSER=firefox
export READER=zathura

# set custom gopath
export GOPATH=$HOME/dev/go

# clean up ~
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export SEST_DIR="$XDG_DATA_HOME/sest"
export LESSHISTFILE="-"
export HISTFILE="$XDG_DATA_HOME/bash_history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"


# things for mitchweaver/subs
export SUBS_FILE="$HOME/media/documents/subs"
export SUBS_MENU_PROG="fzf --no-sort -e --color=16"

# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    sudo cm-rgb-cli logo --color=#ffffff --brightness=10 ring --color=#ffffff --mode=swirl --speed=2 --brightness=10
    sudo msi-rgb 000000 000000 000000 -x
    exec startx
fi
