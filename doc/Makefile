.PHONY: all
all: typerconf.pdf

LATEXFLAGS+=	-shell-escape
TEX_PYTHONTEX=	yes
PYTHONTEXFLAGS=	--interpreter "python:poetry run python3"

typerconf.pdf: ../src/typerconf/init.tex
typerconf.pdf: ../src/typerconf

typerconf.pdf: typerconf.tex overview.tex usage.tex
typerconf.pdf: preamble.tex abstract.tex ../LICENSE

typerconf.pdf: didactic.sty

../src/typerconf::
	${MAKE} -C $@ all

../%::
	${MAKE} -C $(dir $@) $(notdir $@)


.PHONY: clean
clean:
	${RM} typerconf.pdf
	${MAKE} -C ../src/typerconf clean

.PHONY: distclean
distclean:
	${RM} -Rf __pycache__
	${MAKE} -C ../src/typerconf distclean



INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
INCLUDE_DIDACTIC=./didactic
include ${INCLUDE_DIDACTIC}/didactic.mk
