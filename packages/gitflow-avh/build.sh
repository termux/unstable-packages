TERMUX_PKG_HOMEPAGE=https://github.com/petervanderdoes/gitflow/
TERMUX_PKG_DESCRIPTION="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.12.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/petervanderdoes/gitflow/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=3de0d33376fbbfa11d0a0f7d49e2d743f322ff89920c070593b2bbb4187f2af5
TERMUX_PKG_DEPENDS="dash, git"
TERMUX_PKG_EXTRA_MAKE_ARGS="prefix=$TERMUX_PREFIX"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=yes
