# usr

My dotfiles + more, and some tools to manage them.

## .local/bin/opt

Some scripts I've made, which are all licensed under the Unlicense.

## src/suk

[Suckless software](https://suckless.org/) forks.

Licenses are in their respective directories.

### st

Upstream: [git.suckless.org/st](https://git.suckless.org/st/)

From version 0.8.2, my `st` has:
* w3m patch
* scrollback patch
* scrollback-mouse patch
* My own colors, font, and other configurations

## dwm

Upstream: [git.suckless.org/dwm](https://git.suckless.org/dwm/)

From version 6.2, my `dwm` has:

* warp patch
* cfacts patch
* pertag patch (I added `resizehints` into the `Pertag` struct as well)
* tilegap patch (I made the `gappx` changeable at runtime and added it to `Pertag`)
* noborder patch
* movestack patch
* Custom settings in `config.h` 
* My own additions I programmed in (`togglelayout` and `focusmaster` functions, changing how the bar looks, etc.)
 
## dwmblocks

Not from suckless but integrates with `dwm`.

Upstream: [github.com/torrinfail/dwmblocks](https://github.com/torrinfail/dwmblocks/)

I've added my own blocks in `blocks.h` which use some scripts I made.

![Screenshot of my desktop](https://raw.githubusercontent.com/tteeoo/usr/main/scrot.png)
