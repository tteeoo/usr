PREFIX:=${HOME}/.local
NAME:=usr

all:
	@>&2 echo "use 'make install'"

install:
	install -D -m 0755 ${NAME} ${PREFIX}/bin/${NAME}

uninstall:
	rm ${PREFIX}/bin/${NAME}

test:
	shellcheck -s sh ${NAME} modules/test.mod.sh
