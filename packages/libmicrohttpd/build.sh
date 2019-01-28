TERMUX_PKG_HOMEPAGE=http://www.gnu.org/software/libmicrohttpd/
TERMUX_PKG_DESCRIPTION="A small C library that is supposed to make it easy to run an HTTP server as part of another application"
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_VERSION=0.9.62
TERMUX_PKG_SRCURL=https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=bd3e097d703f5091a6a01b56c0464a90fdd17f5d50478cea50a346b25c88db49
TERMUX_PKG_DEPENDS="libgnutls"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-examples
--enable-curl
--enable-https
--enable-largefile
--enable-messages
"
