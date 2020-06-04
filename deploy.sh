#!/bin/sh

link () {
    ln -sf /home/theo/dev/repos/dotfiles/$1 $HOME/$1
}

mkd () {
    mkdir $HOME/.config/fish/functions -p
    mkdir $HOME/media/documents -p
    mkdir $HOME/.config/spotifyd
    mkdir $HOME/.config/gtk-3.0
    mkdir $HOME/.config/picom
    mkdir $HOME/.config/sxhkd
    mkdir $HOME/.config/dunst
    mkdir $HOME/.config/nvim
    mkdir $HOME/.config/rco
}

mkd 2> /dev/null

link .bashrc
link .xinitrc
link .gtkrc-2.0
link .bash_profile
link media/documents/subs
link .config/sxhkd/sxhkdrc
link .config/dunst/dunstrc
link .config/nvim/init.vim
link .config/rco/config.csv
link .config/rco/objects.csv
link .config/picom/picom.conf
link .config/fish/config.fish
link .config/fish/fish_variables
link .config/gtk-3.0/settings.ini
link .config/spotifyd/spotifyd.conf
link .config/fish/functions/fish_prompt.fish
link .config/fish/functions/fish_mode_prompt.fish
