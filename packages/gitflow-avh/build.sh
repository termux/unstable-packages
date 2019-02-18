TERMUX_PKG_HOMEPAGE=https://github.com/petervanderdoes/gitflow/
TERMUX_PKG_DESCRIPTION="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.11.0
TERMUX_PKG_SRCURL=https://github.com/petervanderdoes/gitflow/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=06ad2110088e46e3712f799a43bf6cc5c3720fc25c69dbb3bbf4cf486cf2f330
TERMUX_PKG_DEPENDS="git"
TERMUX_PKG_EXTRA_MAKE_ARGS="prefix=$TERMUX_PREFIX"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=yes
