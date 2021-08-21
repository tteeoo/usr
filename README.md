# usr

My user space (dotfiles, programs, scripts), and some tools to manage them.

The `usr` script is released under the Unlicense.

## In `home/.local/bin`:

Some scripts I've made, which are all released under the Unlicense.

## In `home/src/suk`:

[Suckless software](https://suckless.org/) forks.

Licenses for these programs are in their respective directories.

### st

Upstream: [git.suckless.org/st](https://git.suckless.org/st/).

From version 0.8.2, my `st` has:
* w3m patch
* scrollback patch
* scrollback-mouse patch
* My own colors, font, and other configurations

### dwm

Upstream: [git.suckless.org/dwm](https://git.suckless.org/dwm/).

From version 6.2, my `dwm` has:

* warp patch
* cfacts patch
* pertag patch (I added `resizehints` into the `Pertag` struct as well)
* tilegap patch (I made the `gappx` changeable at runtime and added it to `Pertag`)
* noborder patch
* movestack patch
* Custom settings in `config.h` 
* My own additions I programmed in (`togglelayout` and `focusmaster` functions, changing how the bar looks, etc.)
