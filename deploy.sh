#!/bin/sh

link () {
    ln -sf $(pwd)/$1 $HOME/$1
}

mkd () {
    mkdir $XDG_CONFIG_HOME/fish/functions -p
    mkdir $XDG_DATA_HOME/wineprefixes -p
    mkdir $XDG_CONFIG_HOME/discocss -p
    # mkdir $XDG_CONFIG_HOME/spotifyd
    mkdir $XDG_CONFIG_HOME/spotify-tui
    mkdir $XDG_CONFIG_HOME/newsboat
    mkdir $XDG_CONFIG_HOME/gtk-3.0
    mkdir $XDG_CONFIG_HOME/gtk-2.0
    mkdir $XDG_CONFIG_HOME/python
    mkdir $XDG_CONFIG_HOME/picom
    mkdir $XDG_CONFIG_HOME/sxhkd
    mkdir $XDG_CONFIG_HOME/dunst
    mkdir $XDG_CONFIG_HOME/nvim
    mkdir $XDG_CONFIG_HOME/rco
    mkdir $XDG_CONFIG_HOME/git
    mkdir $XDG_CONFIG_HOME/mpv
    mkdir $XDG_CONFIG_HOME/npm
    mkdir $XDG_CONFIG_HOME/X11
    mkdir $HOME/.vim
}

mkd 2> /dev/null

link .bashrc
link .xinitrc
link .vim/vimrc
link .bash_profile
link .config/wgetrc
link .config/npm/npmrc
link .config/git/config
link .config/mpv/mpv.conf
link .config/python/rc.py
link .config/sxhkd/sxhkdrc
link .config/dunst/dunstrc
link .config/nvim/init.vim
link .config/X11/Xresources
link .config/mpv/input.conf
link .config/newsboat/config
link .config/rco/config.csv
link .config/rco/objects.csv
link .config/picom/picom.conf
link .config/fish/config.fish
link .config/gtk-2.0/gtkrc-2.0
link .config/fish/fish_variables
link .config/gtk-3.0/settings.ini
link .config/spotify-tui/config.yml
link .config/nvim/coc-settings.json
# link .config/spotifyd/spotifyd.conf
link .config/fish/functions/sudo.fish
link .config/fish/functions/fish_prompt.fish
link .config/fish/functions/fish_mode_prompt.fish
link .config/discocss/custom.css
