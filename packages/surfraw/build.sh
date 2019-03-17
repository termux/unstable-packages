TERMUX_PKG_HOMEPAGE=https://gitlab.com/surfraw/Surfraw
TERMUX_PKG_DESCRIPTION="Shell Users' Revolutionary Front Rage Against the Web"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.3.0
TERMUX_PKG_SRCURL=https://gitlab.com/surfraw/Surfraw/repository/surfraw-$TERMUX_PKG_VERSION/archive.tar.bz2
TERMUX_PKG_SHA256=d63c19c382b0e888e442f4106ee6babb5071ce076ab7834028db070814c42556
TERMUX_PKG_DEPENDS="lynx"
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_pre_configure() {
	./prebuild
}
