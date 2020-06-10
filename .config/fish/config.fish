# abbreviations set here as global vars for clarity's sake
abbr -a -g g git
abbr -a -g v nvim
abbr -a -g sv nvim
abbr -a -g p sudo pacman
abbr -a -g nb newsboat -r
abbr -a -g sus sudo systemctl
abbr -a -g sdn sudo shutdown now
abbr -a -g gof gofmt -s -w -e -l .
abbr -a -g vw nvim -c VimwikiIndex
abbr -a -g c 'set fzfcmd ( grep " cmd: " ~/.local/share/fish/fish_history | sed "s/- cmd: //" | fzf -e --color=16 --no-sort ) && echo $fzfcmd && eval $fzfcmd'

# ensure key swap
setxkbmap -option caps:swapescape
