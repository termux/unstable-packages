TERMUX_PKG_HOMEPAGE=https://www.tinc-vpn.org/
TERMUX_PKG_DESCRIPTION="VPN daemon"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.0.35
TERMUX_PKG_SRCURL=https://www.tinc-vpn.org/packages/tinc-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=18c83b147cc3e2133a7ac2543eeb014d52070de01c7474287d3ccecc9b16895e
TERMUX_PKG_DEPENDS="liblzo, openssl"

termux_step_pre_configure() {
	export LIBS="-llog"
}
