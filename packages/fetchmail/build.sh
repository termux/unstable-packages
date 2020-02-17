##
## NOTE: script 'fetchmailconf' uses TkInter which is not available
##       in Termux variant of python2.
##
TERMUX_PKG_HOMEPAGE=https://www.fetchmail.info/
TERMUX_PKG_DESCRIPTION="A remote-mail retrieval utility"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=6.4.2
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/fetchmail/files/branch_${TERMUX_PKG_VERSION:0:3}/fetchmail-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=e21f6b3326f29fdb0c4786b5602aa4b9e668805424d0708eb42be6395c1ca630
TERMUX_PKG_DEPENDS="libcrypt, openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-ssl=$TERMUX_PREFIX"

termux_step_pre_configure() {
	export LIBS="-llog"
}
