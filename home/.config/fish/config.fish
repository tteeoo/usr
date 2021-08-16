# abbreviations set here as global vars for clarity's sake
if which nvim > /dev/null 2>&1
	abbr -ag v nvim
else
	abbr -ag v vim
end
abbr -ag r ranger
abbr -ag z zathura
abbr -ag n nnn -de
abbr -ag nb newsboat -r

abbr -ag g git
abbr -ag gc git commit -S
abbr -ag gs git status
abbr -ag gd git diff
abbr -ag gb git branch
abbr -ag ga git add
abbr -ag gp git pull
abbr -ag gch git checkout
abbr -ag gpsh git push
abbr -ag gbpsh git push --set-upstream origin

abbr -ag cp cp -iv
abbr -ag mv mv -iv
abbr -ag rm rm -v
abbr -ag ll ls -lAh

abbr -ag s sudo
abbr -ag a sudo apt
abbr -ag p sudo pacman
abbr -ag paclean sudo pacman -Rns '(pacman -Qdtq)'
abbr -ag sus sudo systemctl
abbr -ag sdn sudo shutdown now
abbr -ag spn sudo poweroff now

abbr -ag goi go install
abbr -ag goc go clean
abbr -ag gom go mod
abbr -ag gob go build
abbr -ag goe go env
abbr -ag gog go get
abbr -ag gol golint ./...
abbr -ag gof gofmt -s -w -e -l .

abbr -ag vw vimwiki
abbr -ag fn 'fzf | xargs nvim'
abbr -ag mi 'make && sudo make install'

abbr -ag t tmux
abbr -ag ta tmux attach -t
abbr -ag tks tmux kill-session -t
abbr -ag tls tmux list-sessions

abbr -ag c fzfcmd

abbr -ag tes trans -t es 
abbr -ag fes trans -s es 

# aliases
alias bat='cat /sys/class/power_supply/BAT0/capacity'
alias lynx='lynx -accept_all_cookies -vikeys'
alias vimwiki='nvim -c VimwikiIndex -c \'cd $VIMWIKI\''
alias pcmn='pacman -Sl | cut -d" " -f2,3,4 | fzf -m  --preview "pacman -Si {1}" --preview-window=right:66%:wrap | xargs -ro -n 1 sudo pacman -S'
alias fzfcmd='set fzfcmd ( grep " cmd: " $XDG_DATA_HOME/fish/fish_history | sed "s/- cmd: //" | grep -v fzfcmd | tac | fzf -e --color=16 --no-sort ) && echo $fzfcmd && eval $fzfcmd'

# make delete work in st
switch $TERM
	case 'st-*'
	tput smkx
	function st_smkx --on-event fish_postexec
		tput smkx
	end
	function st_rmkx --on-event fish_preexec
		tput rmkx
	end
end

# set the prompt
function fish_prompt
	if test -n "$SSH_TTY"
		echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
	end

	echo -n (set_color 83A598)(pwd)' '

	if which git_status_prompt > /dev/null 2>&1
		echo -n (git_status_prompt)
	else
		echo -e -n "\x1b[0m\$ "
	end
end

# vi mode indicator
function fish_mode_prompt
end

# sudo !!
function sudo
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

# switch two files' names
function sw
	set TMPFILE (mktemp)
	mv -f $argv[1] $TMPFILE && mv $argv[2] $argv[1] && mv $TMPFILE $argv[2]
end

# ensure ssh authentication via gpg
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye
