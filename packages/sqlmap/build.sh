TERMUX_PKG_HOMEPAGE=http://sqlmap.org/
TERMUX_PKG_DESCRIPTION="Automatic SQL injection and database takeover tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=1.4.3
TERMUX_PKG_SRCURL=https://github.com/sqlmapproject/sqlmap/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=c895b8290cdcb3ac947ffccdda5f3da9726139e85204126fae883022acc79b5c
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
	mkdir -p "$PREFIX"/{bin,opt}
	cp -rf  "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmap.py "$TERMUX_PREFIX"/bin/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmapapi.py "$TERMUX_PREFIX"/bin/sqlmapapi
}
