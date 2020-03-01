TERMUX_PKG_HOMEPAGE=http://sqlmap.org/
TERMUX_PKG_DESCRIPTION="Automatic SQL injection and database takeover tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=1.4
TERMUX_PKG_SRCURL=https://github.com/sqlmapproject/sqlmap/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=a913d177a3ab9e64fc6df1d755e3907323214beceb3a48fae6ea867df1cc434b
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
	mkdir -p "$PREFIX"/{bin,opt}
	cp -rf  "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmap.py "$TERMUX_PREFIX"/bin/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmapapi.py "$TERMUX_PREFIX"/bin/sqlmapapi
}
