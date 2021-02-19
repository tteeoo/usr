NAME := usr
PREFIX := ${HOME}/.local

all:
	@>&2 echo "use 'make install'"
install:
	install -D -m 0755 ${NAME} ${PREFIX}/bin/${NAME}
uninstall:
	rm ${PREFIX}/bin/${NAME}
test:
	shellcheck -s sh ${NAME} modules/*.mod.sh
