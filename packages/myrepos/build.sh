TERMUX_PKG_HOMEPAGE=https://myrepos.branchable.com/
TERMUX_PKG_DESCRIPTION="Tool to manage all your version control repos"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.20180726
TERMUX_PKG_SRCURL=https://deb.debian.org/debian/pool/main/m/myrepos/myrepos_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e29c216342b98e7e5751dbc606c44ec474b55b790dcb50aa5d82b4a64efebc56
TERMUX_PKG_DEPENDS="git, perl"
TERMUX_PKG_EXTRA_MAKE_ARGS="PREFIX=$TERMUX_PREFIX"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true
