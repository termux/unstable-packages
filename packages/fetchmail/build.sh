##
## NOTE: script 'fetchmailconf' uses TkInter which is not available
##       in Termux variant of python2.
##
TERMUX_PKG_HOMEPAGE=https://www.fetchmail.info/
TERMUX_PKG_DESCRIPTION="A remote-mail retrieval utility"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=6.4.15
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/fetchmail/files/branch_${TERMUX_PKG_VERSION:0:3}/fetchmail-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=735b217474937e13cfcdea2d42a346bf68487e0d61efebe4d0d9eddcb3a26b96
TERMUX_PKG_DEPENDS="libcrypt, openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-ssl=$TERMUX_PREFIX"

termux_step_pre_configure() {
	export LIBS="-llog"
}
