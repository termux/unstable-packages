TERMUX_PKG_HOMEPAGE=http://sqlmap.org/
TERMUX_PKG_DESCRIPTION="Automatic SQL injection and database takeover tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Rabby Sheikh @xploitednoob"
TERMUX_PKG_VERSION=1.4.11
TERMUX_PKG_SRCURL=https://github.com/sqlmapproject/sqlmap/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=80cc07e08cc7e9662c6b8ce99fd3ae8706458b8009c56369dbb1f57b3b6634c5
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
	mkdir -p "$PREFIX"/{bin,opt}
	cp -rf  "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmap.py "$TERMUX_PREFIX"/bin/sqlmap
	ln -sfr "$TERMUX_PREFIX"/opt/sqlmap/sqlmapapi.py "$TERMUX_PREFIX"/bin/sqlmapapi
}
