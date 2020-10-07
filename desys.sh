#!/bin/bash
chmod u+s /usr/local/bin/slock > /dev/null && echo "OK" || exit 1
# desys.sh (deploy system)
# (C) 2020 Theo Henson, MIT License
# deploys my Arch Linux system

read -p "DEPLOY SYSTEM? (<CR>/<C-c>) "
echo "--START--"

# ---------------------------------------------

printf "removing pcspkr module... "
rmmod pcspkr > /dev/null && echo "OK"

echo "--PACKAGES--"

printf "updating package db... "
pacman -Syu --noconfirm > /dev/null && echo "OK" || exit 1
printf "updating package keyring... "
pacman -S --needed --noconfirm archlinux-keyring > /dev/null && echo "OK" || exit 1
printf "installing packages... "
pacman -S --needed --noconfirm npm lxsession polkit python-pip fzf i3lock-color spotifyd mesa pulsemixer ranger zathura zathura-pdf-mupdf nodejs newsboat lm_sensors neofetch cmatrix htop nemo dmenu icu firefox imagemagick ffmpeg mpv feh nettle git fish sudo xorg wget maim dunst maim sxhkd picom neovim xreader base-devel xorg-xinit alsa-utils noto-fonts pavucontrol ttf-fira-mono > /dev/null && echo "OK" || exit 1

# ---------------------------------------------

echo "--USER--"

printf "creating user theo... "
useradd -m theo > /dev/null && echo "OK" || exit 1
echo "SET PASSWORD"
passwd theo && echo "PASSWORD SET" || exit 1
echo "adding theo to wheel group... "
usermod theo -aG wheel > /dev/null && echo "OK" || exit 1

printf "making repos directory... "
su -c "mkdir -p /home/theo/dev/repos > /dev/null" theo && echo "OK" || exit 1
printf "making documents directory... "
su -c "mkdir -p /home/theo/media/documents > /dev/null" theo && echo "OK" || exit 1

# ---------------------------------------------

echo "--GIT--"

printf "cloning dotfiles... "
su -c "git clone https://github.com/tteeoo/dotfiles /home/theo/dev/repos/dotfiles > /dev/null" theo && echo "OK" || exit 1
printf "deploying dotfiles... "
su -c "cd /home/theo/dev/repos/dotfiles; ./deploy.sh > /dev/null" theo && echo "OK" || exit 1

printf "cloning scripts... "
su -c "git clone https://github.com/tteeoo/scripts /home/theo/dev/scripts > /dev/null" theo && echo "OK" || exit 1
printf "chmoding scripts... "
su -c "cd /home/theo/dev/scripts; ls -A | grep -Ev 'LICENSE|.git|README.md' | xargs -I{} chmod +x {} /home/theo > /dev/null" theo && echo "OK" || exit 1

printf "cloning suckless programs... "
su -c "git clone https://github.com/tteeoo/suckless /home/theo/dev/repos/suckless > /dev/null" theo && echo "OK" || exit 1
printf "chmoding suckless programs... "
su -c "chmod +x /home/theo/dev/repos/suckless/bin/* > /dev/null" theo && echo "OK" || exit 1
printf "copying suckless programs to bin... "
cp /home/theo/dev/repos/suckless/bin/* /usr/local/bin > /dev/null && echo "OK" || exit 1

printf "cloning sest... "
su -c "git clone https://github.com/tteeoo/sest /home/theo/dev/repos/sest > /dev/null" theo && echo "OK" || exit 1
printf "chmoding sest... "
su -c "chmod +x /home/theo/dev/repos/sest/bin/sest > /dev/null" theo && echo "OK" || exit 1
printf "copying sest to bin... "
cp /home/theo/dev/repos/sest/bin/sest /usr/local/bin > /dev/null && echo "OK" || exit 1

printf "cloning rco... "
su -c "git clone https://github.com/tteeoo/rco /home/theo/dev/repos/rco > /dev/null" theo && echo "OK" || exit 1
printf "chmoding rco... "
su -c "chmod +x /home/theo/dev/repos/rco/bin/rco > /dev/null" theo && echo "OK" || exit 1
printf "copying rco to bin... "
cp /home/theo/dev/repos/rco/bin/rco /usr/local/bin > /dev/null && echo "OK" || exit 1

printf "cloning gruvbox-gtk... "
git clone https://github.com/3ximus/gruvbox-gtk /usr/share/themes/gruvbox-gtk > /dev/null && echo "OK" || exit 1

# ---------------------------------------------

echo "--AUR--"

printf "downloading yay binary... "
curl https://directory.theohenson.com/file/bin/yay > /usr/local/bin/yay && echo "OK" || exit 1
printf "chmoding yay binary... "
chmod +x /usr/local/bin/yay > /dev/null && echo "OK" || exit 1
printf "installing aur packages with yay... "
su -c "yay -S --needed --noconfirm spotify-tui-bin > /dev/null" theo && echo "OK" || exit 1

# ---------------------------------------------

echo "--OTHER--"

printf "installing vim-plug... "
su -c "sh -c 'curl -fLo /home/theo/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null" theo && echo "OK" || exit 1

printf "making other directories... "
su -c "mkdir -p /home/theo/media/{audio,desktop,downloads,images,videos} /home/theo/media/images/wall > /dev/null" theo && echo "OK" || exit 1

printf "downloading cat gif... "
su -c "curl https://directory.theohenson.com/file/img/cat.gif > /home/theo/media/images/wall/cat.gif" theo && echo "OK" || exit 1

export XDG_CACHE_HOME=/home/theo/.cache
export SUBS_FILE=/home/theo/media/documents/subs
printf "downloading subs... "
curl https://raw.githubusercontent.com/mitchweaver/subs/master/subs > /usr/local/bin/subs && echo "OK" || exit 1
printf "chmoding subs... "
chmod +x /usr/local/bin/subs && echo "OK" || exit 1
printf "generating subs links... "
su -c "subs -g > /dev/null" theo && echo "OK" || exit 1

printf "auto detecting sensors... "
sensors-detect --auto > /dev/null && echo "OK" || exit 1

echo "--END--"
echo "<C-d> and login as theo!"
echo "Remember to install graphics drivers for your specific GPU"
exit 0
