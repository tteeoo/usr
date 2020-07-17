# start fish if fish is not the parent process
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
    exec fish
fi

# prompt
PS1="\033[96m[bash] \033[94m$(pwd) $(git_status_prompt)"

# aliases
alias g="git"
alias v="nvim"
alias p="sudo pacman"
alias ls='ls --color=auto'
alias sdn="sudo shutdown now"
