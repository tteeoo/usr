# abbreviations set here as global vars for clarity's sake
abbr -a -g g git
abbr -a -g v nvim
abbr -a -g sv nvim
abbr -a -g p sudo pacman
abbr -a -g sudo systemctl

# add directories to path
set -x PATH /home/theo/dev/scripts /home/theo/.local/bin /home/theo/dev/go/bin /home/theo/.cargo/bin $PATH

# set some default programs
set -x SHELL fish
set -x VISUAL nvim
set -x EDITOR nvim
set -x BROWSER firefox

# set custom gopath
set -x GOPATH /home/theo/dev/go

# things for mitchweaver/subs
set -x XDG_CACHE_HOME /home/theo/.cache
set -x SUBS_FILE /home/theo/media/documents/subs
set -x SUBS_MENU_PROG "dmenu -fn FiraMono:size=11 -l 24 -nf #ebdbb2 -nb #282828 -sb #b16286 -sf #282828 -p subs:"
