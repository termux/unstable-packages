TERMUX_PKG_HOMEPAGE=https://github.com/vlang/v
TERMUX_PKG_DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.1.18
TERMUX_PKG_SRCURL=("https://github.com/vlang/v/archive/$TERMUX_PKG_VERSION.tar.gz"
                   "https://github.com/vlang/vc/archive/$TERMUX_PKG_VERSION.tar.gz")
TERMUX_PKG_SHA256=("3f3407a78aca7fc3b42a3fc1f1d2b9724c1e4c71fbd5d37ff12976cd2305cec1"
                   "b8697082b4b89aeadae2a5bf3626459419f3826b061ecf960fc582c854361e2e")
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	# Vlang doesn't seems to support cross-compilation so we need only to obtain
	# the generated C source file and compile it for target.
	(unset CC CFLAGS CPPFLAGS LDFLAGS;
		gcc "vc-$TERMUX_PKG_VERSION"/v.c -o v.host -lm
		./v.host -debug -o v.host.2 compiler
		mv .v.host.2.c v.c
	)

	$CC $CFLAGS $CPPFLAGS v.c -o v -lm
}

termux_step_make_install() {
	install -Dm700 v "$TERMUX_PREFIX"/bin/v
}
