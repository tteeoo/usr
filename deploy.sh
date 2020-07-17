#!/bin/sh

link () {
    ln -sf /home/theo/dev/repos/dotfiles/$1 $HOME/$1
}

mkd () {
    mkdir $HOME/.config/BetterDiscord/themes -p
    mkdir $HOME/.config/fish/functions -p
    # mkdir $HOME/.config/spotifyd
    mkdir $HOME/.config/spotify-tui
    mkdir $HOME/.config/gtk-3.0
    mkdir $HOME/.config/picom
    mkdir $HOME/.config/sxhkd
    mkdir $HOME/.config/dunst
    mkdir $HOME/.config/nvim
    mkdir $HOME/.config/rco
    mkdir $HOME/.config/mpv
    mkdir $HOME/.newsboat
}

mkd 2> /dev/null

link .bashrc
link .xinitrc
link .gtkrc-2.0
link .Xresources
link .bash_profile
link .newsboat/config
link .config/mpv/mpv.conf
link .config/mpv/input.conf
link .config/sxhkd/sxhkdrc
link .config/dunst/dunstrc
link .config/nvim/init.vim
link .config/nvim/coc-settings.json
link .config/rco/config.csv
link .config/rco/objects.csv
link .config/picom/picom.conf
link .config/fish/config.fish
link .config/fish/fish_variables
link .config/gtk-3.0/settings.ini
link .config/spotify-tui/config.yml
# link .config/spotifyd/spotifyd.conf
link .config/fish/functions/sudo.fish
link .config/fish/functions/fish_prompt.fish
link .config/fish/functions/fish_mode_prompt.fish
link .config/BetterDiscord/themes/simple-gruvbox.theme.css
