TERMUX_PKG_HOMEPAGE=https://www.haproxy.org/
TERMUX_PKG_DESCRIPTION="The Reliable, High Performance TCP/HTTP Load Balancer"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=2.3.10
TERMUX_PKG_SRCURL=http://www.haproxy.org/download/${TERMUX_PKG_VERSION:0:3}/src/haproxy-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9946e0cfc83f29072b3431e37246221cf9d4a9d28a158c075714d345266f4f35
TERMUX_PKG_DEPENDS="liblua53, openssl, pcre, zlib"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_CONFFILES="etc/haproxy/haproxy.cfg"

termux_step_make() {
	CC="$CC -Wl,-rpath=$TERMUX_PREFIX/lib -Wl,--enable-new-dtags"

	make \
		CPU=generic \
		TARGET=generic \
		USE_GETADDRINFO=1 \
		USE_LUA=1 \
		LUA_INC="$TERMUX_PREFIX/include/lua5.3" \
		LUA_LIB="$TERMUX_PREFIX/lib"
		LUA_LIB_NAME=lua5.3 \
		USE_OPENSSL=1 \
		USE_PCRE=1 \
		PCRE_INC="$TERMUX_PREFIX/include" \
		PCRE_LIB="$TERMUX_PREFIX/lib" \
		USE_ZLIB=1 \
		ADDINC="$CPPFLAGS" \
		CFLAGS="$CFLAGS" \
		LDFLAGS="$LDFLAGS"
}

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

	mkdir -p "$TERMUX_PREFIX"/etc/haproxy
	sed -e "s|@TERMUX_PREFIX@|${TERMUX_PREFIX}|g" \
		"$TERMUX_PKG_BUILDER_DIR"/haproxy.cfg.in \
		> "$TERMUX_PREFIX"/etc/haproxy/haproxy.cfg

	mkdir -p "$TERMUX_PREFIX"/share/haproxy/examples/errorfiles
	install -m600 examples/*.cfg "$TERMUX_PREFIX"/share/haproxy/examples/
	install -m600 examples/errorfiles/*.http \
		"$TERMUX_PREFIX"/share/haproxy/examples/errorfiles/
}
