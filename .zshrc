# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    eval "sudo cm-rgb-cli logo --color=#ffffff --brightness=10 fan --color=#ffffff --speed=3 --brightness=10 ring --color=#ffffff --mode=swirl --speed=3 --brightness=10"
    startx
fi

# Enable colors and change prompt:
autoload colors && colors
source /home/theo/dev/repos/gitstatus/gitstatus.prompt.zsh
PS1=$'\033[0;34m%d \033[0;35m$\033[0m '
RPS1='$GITSTATUS_PROMPT'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#export path
export PATH=$PATH:/home/theo/dev/scripts/:/home/theo/.local/bin:/home/theo/dev/go/bin/:/home/theo/.cargo/bin/

# neovim
export VISUAL="nvim"

# subs
export XDG_CACHE_HOME="/home/theo/.cache"
export SUBS_FILE=/home/theo/media/documents/subs
export SUBS_MENU_PROG="dmenu -fn FiraMono:size=11 -l 24 -nf #ebdbb2 -nb #282828 -sb #b16286 -sf #282828 -p subs:"

#export go
export GOPATH=/home/theo/dev/go

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[[P' delete-char

# Load aliases and shortcuts if existent.
source $HOME/.aliases

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
