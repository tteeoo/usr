# add directories to path
export PATH=$PATH:/home/theo/dev/scripts:/home/theo/.local/bin:/home/theo/dev/go/bin:/home/theo/.cargo/bin

# set some default programs
export SHELL=fish
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=firefox

# set custom gopath
export GOPATH=/home/theo/dev/go

# things for mitchweaver/subs
export XDG_CACHE_HOME=/home/theo/.cache
export SUBS_FILE=/home/theo/media/documents/subs
export SUBS_MENU_PROG="fzf --color=16"

# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    setxkbmap -option caps:swapescape
    sudo cm-rgb-cli logo --color=#ffffff --brightness=10 fan --color=#ffffff --speed=3 --brightness=10 ring --color=#ffffff --mode=swirl --speed=3 --brightness=10
    exec startx
fi
