# start fish if fish is not the parent process
parent="$(ps --no-header --pid=$PPID --format=cmd)"
[ "$parent" != "fish" ] && [ "$parent" != "-fish" ] && exec fish

# prompt
if which git_status_prompt > /dev/null 2>&1 ; then
	PS1="\[\033[96m\][bash] \[\033[94m\w\] \[\$(git_status_prompt)\]"
else
	PS1="\[\033[96m\][bash] \[\033[94m\w\] \033[0m$ "
fi

# aliases
alias g="git"
alias v="nvim"
alias t="tmux"
alias p="sudo pacman"
alias a="sudo apt"
alias sus="sudo systemctl"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias ls="ls --color=auto"
