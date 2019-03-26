TERMUX_PKG_HOMEPAGE=https://github.com/direnv/direnv
TERMUX_PKG_DESCRIPTION="Environment switcher for shell"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.19.2
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/direnv/direnv/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=407e46233942277dcac133bcf9dc656c825299c611d0b22b9cd02841c4c34ffb
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	make
}

termux_step_make_install() {
	make install DESTDIR=$TERMUX_PREFIX
}
