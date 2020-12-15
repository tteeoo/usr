# abbreviations set here as global vars for clarity's sake
abbr -ag g git
abbr -ag v nvim
abbr -ag r ranger
abbr -ag cp cp -i
abbr -ag mv mv -i
abbr -ag n nnn -de
abbr -ag z zathura
abbr -ag p sudo pacman
abbr -ag nb newsboat -r
abbr -ag sus sudo systemctl
abbr -ag sdn sudo shutdown now
abbr -ag gof gofmt -s -w -e -l .
abbr -ag vw nvim -c VimwikiIndex
abbr -ag mi 'make && sudo make install'
abbr -ag c fzfcmd

# aliases
alias fzfcmd='set fzfcmd ( grep " cmd: " $XDG_DATA_HOME/fish/fish_history | sed "s/- cmd: //" | grep -v fzfcmd | tac | fzf -e --color=16 --no-sort ) && echo $fzfcmd && eval $fzfcmd'
alias lynx='lynx -accept_all_cookies -vikeys'
alias vimwiki='nvim -c VimwikiIndex'
alias pcmn='pacman -Sl | cut -d" " -f2,3,4 | fzf -m  --preview "pacman -Si {1}" --preview-window=right:66%:wrap | xargs -ro -n 1 sudo pacman -S'

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

	echo -n (git_status_prompt)
end

function fish_mode_prompt
	# turns off vi mode indicator
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
