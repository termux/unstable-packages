TERMUX_PKG_HOMEPAGE=https://github.com/google/glog
TERMUX_PKG_DESCRIPTION="Logging library for C++"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.4.0
TERMUX_PKG_SRCURL=https://github.com/google/glog/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c
TERMUX_PKG_DEPENDS="libandroid-glob, libc++"

termux_step_pre_configure() {
	export LIBS="-landroid-glob -llog"
}
