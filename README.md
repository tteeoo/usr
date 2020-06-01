This repository is mainly for my own convenience, although it may also serve as inspiration or a starting off point for your own suckless forks.

# Suckless
Suckless software is "software that sucks less": [suckless.org](https://suckless.org/)

Suckless software is made to be a simple as possible while still doing their job well, fitting the UNIX philosophy.

This is achieved by having configuration built into the program (recomplied with every config change) and keeping the code clean and concise.

Suckless software is highly extensible with user submitted patches.

# My builds
This repository contain my forks of various suckless programs with my own changes, configurations, and applied patches.

While `dwmblocks` isn't an official suckless program, it follows the suckless philosophy and integrates with `dwm`.

## st
Upstream at: [git.suckless.org/st](https://git.suckless.org/st/)
Forked from version 0.8.2, my `st` build has:
* alpha patch
* alphaFocusHighlight patch
* scrollback patch
* scrollback-mouse patch
* My own colors, font, and other configurations

## dwm
Upstream at: [git.suckless.org](https://git.suckless.org/dwm/)
Forked from version 6.2, my `dwm` build has:
* pertag patch
* sticky patch
* movestack patch
* vanitygaps patch
* My own additions (`togglemono` function)
* My own colors, keybinds, and other configurations

## slock
Upstream at: [git.suckless.org/st](https://git.suckless.org/st/)
Forked from version 1.4, I've only really changed the colors.

## dwmblocks
Upstream at: [github.com/torrinfail/dwmblocks](https://github.com/torrinfail/dwmblocks/)
I've only added my only blocks from volume, date, and time.
