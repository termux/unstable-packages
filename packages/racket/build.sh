TERMUX_PKG_HOMEPAGE=https://racket-lang.org
TERMUX_PKG_DESCRIPTION="Full-spectrum programming language going beyond Lisp and Scheme"
TERMUX_PKG_LICENSE="GPL-3.0, LGPL-3.0"
TERMUX_PKG_LICENSE_FILE="COPYING-libscheme.txt COPYING.txt COPYING_LESSER.txt"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=7.3
TERMUX_PKG_SRCURL=https://www.cs.utah.edu/plt/installers/${TERMUX_PKG_VERSION}/racket-minimal-${TERMUX_PKG_VERSION}-src-builtpkgs.tgz
TERMUX_PKG_SHA256=40286b2de8aaeed70d2dbebcbbb89f1be55be00fd55f4522635b7a51a58d6dc2
TERMUX_PKG_DEPENDS="libandroid-support, libffi"
TERMUX_PKG_NO_DEVELSPLIT=true
TERMUX_PKG_HOSTBUILD=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-racket=$TERMUX_PKG_HOSTBUILD_DIR/racket/racketcgc
--enable-libs
--disable-shared
--disable-gracket
--enable-libffi"

termux_step_host_build() {
	"$TERMUX_PKG_SRCDIR"/src/configure \
		$TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS
	make -j "$TERMUX_MAKE_PROCESSES"
}

termux_step_pre_configure() {
	CPPFLAGS+=" -I$TERMUX_PKG_SRCDIR/src/racket/include -I$TERMUX_PKG_BUILDDIR/racket"
	LDFLAGS+=" -llog"
	export TERMUX_PKG_SRCDIR="$TERMUX_PKG_SRCDIR/src"
}
