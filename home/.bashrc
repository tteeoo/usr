runif() {
	if which "$1" > /dev/null 2>&1 ; then
		$@ &
	fi
}

# ensure ssh authentication via gpg
export SSH_AUTH_SOCK="$(runif gpgconf --list-dirs agent-ssh-socket)"
runif gpgconf --launch gpg-agent > /dev/null

# prompt
if which git_status_prompt > /dev/null 2>&1 ; then
	PS1="\[\033[94m\w\] \[\$(git_status_prompt)\]"
else
	PS1="\[\033[94m\w\] \033[0m$ "
fi

# aliases
alias g="git"
alias v="nvim"
alias t="tmux"
alias s="sudo"
alias p="sudo pacman"
alias a="sudo apt"
alias sus="sudo systemctl"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias ls="ls --color=auto"

# tmux
cfile="$HOME/.tmux.conf"
if [ -f "$XDG_CONFIG_HOME/tmux/tmux.conf" ] ; then
	cfile="$XDG_CONFIG_HOME/tmux/tmux.conf"
fi

[ "$NOTMX" = "" ] &&  [ "$TMUX" = "" ] && [ "$TERM" != "linux" ] && exec tmux -f -2 "$cfile"
