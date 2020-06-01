# startx if in tty1 also sets my heatsinks colors (comment this out)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    sudo cm-rgb-cli logo --color=#ffffff --brightness=10 fan --color=#ffffff --speed=3 --brightness=10 ring --color=#ffffff --mode=swirl --speed=3 --brightness=10
    exec startx
fi
