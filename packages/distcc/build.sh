TERMUX_PKG_HOMEPAGE=http://distcc.org/
TERMUX_PKG_DESCRIPTION="Distributed C/C++ compiler."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=3.3.2
TERMUX_PKG_SRCURL=https://github.com/distcc/distcc/releases/download/v$TERMUX_PKG_VERSION/distcc-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=64894de2970c631801d29c9962553673ea7a1d150e6855d7e166d273fca5cdfc
TERMUX_PKG_DEPENDS="libpopt"
TERMUX_PKG_BUILD_IN_SRC=yes

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-pump-mode
--without-avahi
--without-gtk
--without-libiberty
"

termux_step_pre_configure() {
	./autogen.sh
	export LIBS="-llog"
}
