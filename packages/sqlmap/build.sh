TERMUX_PKG_HOMEPAGE=http://sqlmap.org/
TERMUX_PKG_DESCRIPTION="Automatic SQL injection and database takeover tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=1.4.2
TERMUX_PKG_SRCURL=https://github.com/sqlmapproject/sqlmap/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=77faf85164eb17dce769ec830cbd146768644315bc1024613ad13155e09c2d11
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
	mkdir -p "$PREFIX"/{bin,opt}
	cp -rf  "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmap.py "$TERMUX_PREFIX"/bin/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmapapi.py "$TERMUX_PREFIX"/bin/sqlmapapi
}
