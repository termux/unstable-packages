TERMUX_PKG_HOMEPAGE=http://sqlmap.org/
TERMUX_PKG_DESCRIPTION="Automatic SQL injection and database takeover tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=1.4.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/sqlmapproject/sqlmap/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=d4ca1b529942c61243759727ec41f43dff19880ed63fca6b10df34f5b71579e6
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
	mkdir -p "$PREFIX"/{bin,opt}
	cp -rf  "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmap.py "$TERMUX_PREFIX"/bin/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmapapi.py "$TERMUX_PREFIX"/bin/sqlmapapi
}
