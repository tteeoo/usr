# theo_scripts module

theo_suk_arch_add() {
	printf "theo_suk_arch: installing packages\n"
	sudo pacman -S --needed --noconfirm --quiet libxinerama libxft libx11 freetype2 make gcc
	printf "theo_suk_arch: linking %s/src/suk\n" "$HOME"
	mkdir -p "$HOME"/src/suk
	ln -sf "$USR_DIR"/home/src/suk "$HOME"/src/suk

	printf "theo_suk_arch: compiling software and linking binaries\n"
	mkdir -p "$HOME"/.local/bin
	for PROG in dwm st dwmblocks ; do
		cd "$USR_DIR/home/src/suk/$PROG" || exit
		make
		chmod +x "$PROG"
		ln -sf "$USR_DIR/home/src/suk/$PROG/$PROG" "$HOME/.local/bin/$PROG"
	done
}

theo_suk_arch_remove() {
	printf "theo_suk_arch: unlinking %s/src/suk\n" "$HOME"
	rm "$HOME"/src/suk
	printf "theo_suk_arch: unlinking binaries\n"
	rm "$HOME"/.local/bin/st "$HOME"/.local/bin/dwm "$HOME"/.local/bin/dwmblocks
}

theo_suk_arch_info() {
	printf "Installs my (theo's) build of some suckless software, and dependencies for them with pacman."
}

theo_suk_arch_dirs() {
	printf "src/suk/dwmblocks src/suk/dwm src/suk/st"
}

theo_suk_arch_files() {
	printf "src/suk/dwm/config.h src/suk/dwm/Makefile src/suk/dwm/config.mk
		src/suk/dwm/drw.c src/suk/dwm/drw.h src/suk/dwm/dwm.c
		src/suk/dwm/util.c src/suk/dwm/util.h
		src/suk/st/config.h src/suk/st/Makefile src/suk/st/config.mk
		src/suk/st/win.h src/suk/st/st.h src/suk/st/st.c
		src/suk/st/x.c src/suk/st/arg.h
		src/suk/dwmblocks/Makefile src/suk/dwmblocks/blocks.h
		src/suk/dwmblocks/dwmblocks.c"
}
