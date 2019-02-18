## COMPLETELY UNTESTED !
##
## Previous version (4.0.0) worked on Samsung Galaxy S7
## with Android 6 ROM. But it is not working on Android 7
## and higher.
##

TERMUX_PKG_HOMEPAGE=https://hashcat.net/hashcat
TERMUX_PKG_DESCRIPTION="World's fastest and most advanced password recovery utility"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=5.1.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/hashcat/hashcat/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=283beaa68e1eab41de080a58bb92349c8e47a2bb1b93d10f36ea30f418f1e338
TERMUX_PKG_DEPENDS="libandroid-support"
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_pre_configure() {
	CFLAGS+=" -isystem $TERMUX_PKG_BUILDER_DIR/include"
}
