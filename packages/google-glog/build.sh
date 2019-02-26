TERMUX_PKG_HOMEPAGE=https://github.com/google/glog
TERMUX_PKG_DESCRIPTION="Logging library for C++"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.3.5
TERMUX_PKG_DEPENDS=1
TERMUX_PKG_SRCURL=https://github.com/google/glog/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0
TERMUX_PKG_DEPENDS="libandroid-glob, libc++"

termux_step_pre_configure() {
	export LIBS="-landroid-glob -llog"
}
