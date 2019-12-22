TERMUX_PKG_HOMEPAGE=https://github.com/vlang/v
TERMUX_PKG_DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.1.20
TERMUX_PKG_REVISION=4
TERMUX_PKG_SRCURL=("https://github.com/vlang/v/archive/$TERMUX_PKG_VERSION.tar.gz"
                   "https://github.com/vlang/vc/archive/$TERMUX_PKG_VERSION.tar.gz")
TERMUX_PKG_SHA256=("8102b48b2c82be6be14633e76e71e215aab5221198315436f97be53e1abe1f5d"
                   "5b4fc1f39c3aef5214a3366e0d514ee2879a2e52a918dc0181df833028a0eb72")
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	# Vlang doesn't seems to support cross-compilation so we need only to obtain
	# the generated C source file and compile it for target.
	(unset CC CFLAGS CPPFLAGS LDFLAGS;
		gcc "vc-$TERMUX_PKG_VERSION"/v.c -o v.host -lm
		./v.host -debug -o v.host.2 compiler
		mv v.host.2.tmp.c v.c
	)

	$CC $CFLAGS $CPPFLAGS v.c -o v -lm
}

termux_step_make_install() {
	install -Dm700 v "$TERMUX_PREFIX"/libexec/vlang/v
	ln -sfr "$TERMUX_PREFIX"/libexec/vlang/v "$TERMUX_PREFIX"/bin/v
	rm -rf "$TERMUX_PREFIX"/libexec/vlang/vlib
	cp -a vlib "$TERMUX_PREFIX"/libexec/vlang/
}
