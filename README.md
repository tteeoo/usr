# Suckless
This repository is mainly for my own convenience, although it may also serve as inspiration or a starting off point for your own suckless forks.

Suckless software is "software that sucks less": [suckless.org](https://suckless.org/)

Suckless software is made to be a simple as possible while still doing its job well, fitting with the UNIX philosophy.

This is achieved by having configuration built into the program, and keeping the code clean and concise (among other things).

Suckless software is highly extensible through user submitted patches on their website.

# My builds
This repository contain my forks of various suckless programs with my own changes, configurations, and applied patches.

While `dwmblocks` isn't an official suckless program, it follows the suckless philosophy and integrates with `dwm`.

## st
Upstream at: [git.suckless.org/st](https://git.suckless.org/st/)

Forked from version 0.8.2, my `st` build has:
* w3m patch
* scrollback patch
* scrollback-mouse patch
* My own colors, font, and other configurations

## dwm
Upstream at: [git.suckless.org/dwm](https://git.suckless.org/dwm/)

Forked from version 6.2, my `dwm` build has:
* cfacts patch
* pertag patch
* tilegap patch
* noborder patch
* movestack patch
* Removed some features
* My own colors, keybinds, and other configurations
* My own additions I programmed in (`togglelayout` and `focusmaster` functions, changing how the bar looks)
 
## dwmblocks
Upstream at: [github.com/torrinfail/dwmblocks](https://github.com/torrinfail/dwmblocks/)

I've added my own blocks for:
* volume 
* cpu temp and usage
* date and time

See the scripts for these blocks at [tteeoo/scripts](https://github.com/tteeoo/scripts).

<hr>

A screenshot featuring `dwm`, `st`, and `dwmblocks`:
![Screenshot](https://raw.githubusercontent.com/tteeoo/suckless/master/screenshot.png)
