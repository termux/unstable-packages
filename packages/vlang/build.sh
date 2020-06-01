TERMUX_PKG_HOMEPAGE=https://github.com/vlang/v
TERMUX_PKG_DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=0.1.24
TERMUX_PKG_SRCURL=("https://github.com/vlang/v/archive/$TERMUX_PKG_VERSION.tar.gz"
                   "https://github.com/vlang/vc/archive/f3a3347956a1912bce90e0a2214ad63a86608175.tar.gz")
TERMUX_PKG_SHA256=("77ed24bf1c3c4eba057ace13bf0fff6fef6d9cdb3c2970f52b4be4582a148e2e"
                   "c1a4e27e5808ebc4d172a300b5ab40d2840d9ffc11450489ad54e3dd3be43511")
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	# Vlang doesn't seems to support cross-compilation so we need only to obtain
	# the generated C source file and compile it for target.
	(unset CC CFLAGS CPPFLAGS LDFLAGS;
		gcc vc-*/v.c -o v.host -lm
		./v.host -debug -o v.c v.v
	)

	$CC $CFLAGS $CPPFLAGS v.c -o v -lm
}

termux_step_make_install() {
	install -Dm700 v "$TERMUX_PREFIX"/libexec/vlang/v
	ln -sfr "$TERMUX_PREFIX"/libexec/vlang/v "$TERMUX_PREFIX"/bin/v
	rm -rf "$TERMUX_PREFIX"/libexec/vlang/vlib
	cp -a vlib "$TERMUX_PREFIX"/libexec/vlang/
}
