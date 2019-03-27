TERMUX_PKG_HOMEPAGE=https://www.haproxy.org/
TERMUX_PKG_DESCRIPTION="The Reliable, High Performance TCP/HTTP Load Balancer"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.9.5
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://haproxy.org/download/${TERMUX_PKG_VERSION%.*}/src/haproxy-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=407260ce65d7a16d93a037976712a8742985ce29360b6d5c187a849b6c0fbf8c
TERMUX_PKG_DEPENDS="liblua, openssl, pcre"
TERMUX_PKG_BUILD_IN_SRC=yes

TERMUX_PKG_EXTRA_MAKE_ARGS="
CPU=generic
TARGET=generic
USE_GETADDRINFO=1
USE_OPENSSL=1
USE_PCRE=1
USE_ZLIB=1
USE_LUA=1
LUA_LIB_NAME=lua"

termux_step_post_make_install() {
	for contrib in halog iprange ip6range; do
		make -C "contrib/$contrib" \
			CC="$CC"
			SBINDIR="$TERMUX_PREFIX/bin" \
			OPTIMIZE= \
			CFLAGS="$CFLAGS $CPPFLAGS" \
			LDFLAGS="$LDFLAGS"
		install -Dm700 "contrib/$contrib/$contrib" \
			"$TERMUX_PREFIX/bin/$contrib"
	done
}
