# abbreviations set here as global vars for clarity's sake
abbr -ag g git
abbr -ag v nvim
abbr -ag r ranger
abbr -ag cp cp -i
abbr -ag mv mv -i
abbr -ag z zathura
abbr -ag p sudo pacman
abbr -ag nb newsboat -r
abbr -ag sus sudo systemctl
abbr -ag sdn sudo shutdown now
abbr -ag gof gofmt -s -w -e -l .
abbr -ag vw nvim -c VimwikiIndex
abbr -ag mi 'make && sudo make install'
abbr -ag c fzfcmd

alias fzfcmd='set fzfcmd ( grep " cmd: " ~/.local/share/fish/fish_history | sed "s/- cmd: //" | grep -v fzfcmd | tac | fzf -e --color=16 --no-sort ) && echo $fzfcmd && eval $fzfcmd'
alias lynx='lynx -accept_all_cookies -vikeys'
alias vimwiki='nvim -c VimwikiIndex'

switch $TERM
    case 'st-*' # suckless' simple terminal
                # Enable keypad, do it once before fish_postexec ever fires
        tput smkx
        function st_smkx --on-event fish_postexec
            tput smkx
        end
        function st_rmkx --on-event fish_preexec
            tput rmkx
        end
end
