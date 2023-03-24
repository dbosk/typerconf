SUBDIR_GOALS=all clean distclean

SUBDIR+=	src/typerconf
SUBDIR+=	doc
SUBDIR+=	tests

version=$(shell sed -n 's/^ *version *= *\"\([^\"]\+\)\"/\1/p' pyproject.toml)

.PHONY: all
all:	README.md

README.md: doc/usage.tex
	pandoc -o $@ $^
	sed -Ei 's/``` \{\.(.*)\}/```\1/' $@

.PHONY: publish
publish: all
	poetry build
	poetry publish
	git push
	gh release create -t v${version} v${version} doc/typerconf.pdf


.PHONY: clean distclean
clean:
distclean:
	${RM} -Rf dist

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/subdir.mk
