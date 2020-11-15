PREFIX=/usr/local
NAME=usr

all:
	@>&2 echo "use 'make install'"

install:
	install -D -m 0755 ${NAME} ${DESTDIR}${PREFIX}/bin/${NAME}

uninstall:
	rm ${DESTDIR}${PREFIX}/bin/${NAME}

test:
	shellcheck -s sh ${NAME} modules/test.mod.sh
