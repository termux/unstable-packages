TERMUX_PKG_HOMEPAGE=http://distcc.org/
TERMUX_PKG_DESCRIPTION="Distributed C/C++ compiler."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=3.3.5
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/distcc/distcc/releases/download/v$TERMUX_PKG_VERSION/distcc-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=7a8e45a3a2601b7d5805c7d5b24918e3ad84b6b5cc9153133f432fdcc6dce518
TERMUX_PKG_DEPENDS="libpopt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-pump-mode
--without-avahi
--without-gtk
--without-libiberty"

termux_step_pre_configure() {
	./autogen.sh
	export LIBS="-llog"
}
