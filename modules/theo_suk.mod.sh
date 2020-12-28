theo_suk_add() {
	printf "theo_suk: linking %s/src/suk\n" "$HOME"
	ln -sf "$USR_DIR"/home/src/suk "$HOME"/src/suk

	printf "theo_suk: compiling software and linking binaries\n"
	mkdir -p "$HOME"/.local/bin
	for PROG in dwm st dwmblocks dmenu ; do
		cd "$USR_DIR/home/src/suk/$PROG" || exit
		make -j4
		ln -sf "$USR_DIR/home/src/suk/$PROG/$PROG" "$HOME/.local/bin/$PROG"
		if [ "$PROG" = "dmenu" ] ; then
			ln -sf "$USR_DIR/home/src/suk/$PROG/$PROG"_run "$HOME/.local/bin/$PROG"_run
			ln -sf "$USR_DIR/home/src/suk/$PROG/$PROG"_path "$HOME/.local/bin/$PROG"_path
			ln -sf "$USR_DIR/home/src/suk/$PROG/stest" "$HOME/.local/bin/stest"
		fi
	done
}

theo_suk_remove() {
	printf "theo_suk: unlinking %s/src/suk\n" "$HOME"
	rm "$HOME"/src/suk
	printf "theo_suk: unlinking binaries\n"
	rm "$HOME"/.local/bin/st "$HOME"/.local/bin/dwm "$HOME"/.local/bin/dwmblocks \
		"$HOME"/.local/bin/dmenu "$HOME"/.local/bin/dmenu_run "$HOME"/.local/bin/dmenu_path \
			"$HOME"/.local/bin/stest
}

theo_suk_info() {
	printf "Installs my (theo's) build of some suckless software"
}

theo_suk_dirs() {
	printf "src/suk/dwmblocks src/suk/dwm src/suk/st src/suk/dmenu"
}


theo_suk_files() {
	printf "src/suk/dwm/config.h src/suk/dwm/Makefile src/suk/dwm/config.mk
		src/suk/dwm/drw.c src/suk/dwm/drw.h src/suk/dwm/dwm.c
		src/suk/dwm/util.c src/suk/dwm/util.h
		src/suk/st/config.h src/suk/st/Makefile src/suk/st/config.mk
		src/suk/st/win.h src/suk/st/st.h src/suk/st/st.c
		src/suk/st/x.c src/suk/st/arg.h
		src/suk/dwmblocks/Makefile src/suk/dwmblocks/blocks.h
		src/suk/dwmblocks/dwmblocks.c src/suk/dmenu/Makefile
		src/suk/dmenu/arg.h src/suk/dmenu/config.h src/suk/dmenu/config.mk
		src/suk/dmenu/dmenu.c src/suk/dmenu/dmenu_path src/suk/dmenu/dmenu_run
		src/suk/dmenu/drw.c src/suk/dmenu/drw.h src/suk/dmenu/stest.c
		src/suk/dmenu/util.c src/suk/dmenu/util.h"
}
