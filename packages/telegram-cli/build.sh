TERMUX_PKG_HOMEPAGE=https://github.com/vysheng/tg
TERMUX_PKG_DESCRIPTION="Telegram messenger CLI"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=1.4.1
TERMUX_PKG_DEPENDS="libconfig, libevent, libjansson, openssl, readline, zlib, lua52"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_HOSTBUILD=true

termux_step_get_source() {
	mkdir -p "$TERMUX_PKG_SRCDIR"
	cd "$TERMUX_PKG_SRCDIR"
	git clone https://github.com/vysheng/tg
	cd tg
	git submodule update --init --recursive
	mv * ../
}

termux_step_host_build() {
	cp -rf $TERMUX_PKG_SRCDIR/* ./
	./configure
	make bin/generate
	make bin/tl-parser
}

termux_step_post_configure() {
	cp -a $TERMUX_PKG_HOSTBUILD_DIR/bin ./
	touch -d "next hour" bin/generate bin/tl-parser
	sed -i -e 's@-I/usr/local/include@@g' -e 's@-I/usr/include@@g' Makefile
}

termux_step_make_install() {
	install -Dm700 -t "$TERMUX_PREFIX"/bin/ bin/telegram-cli
	install -Dm600 tg-server.pub "$TERMUX_PREFIX"/etc/telegram-cli/server.pub
	install -Dm600 -t "$TERMUX_PREFIX"/share/man/man8/ debian/telegram-cli.8
}
