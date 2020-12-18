# start fish if fish is not the parent process
PARENT="$(ps --no-header --pid=$PPID --format=cmd)"
[ "$PARENT" != "fish" ] && [ "$PARENT" != "-fish" ] && exec fish

# prompt
PS1="\[\033[96m\][bash] \[\033[94m\w\] \[\$(git_status_prompt)\]"

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
