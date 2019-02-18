TERMUX_PKG_HOMEPAGE=https://github.com/vysheng/tg
TERMUX_PKG_DESCRIPTION="Telegram messenger CLI"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.3.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="libconfig, libevent, libjansson, openssl, readline"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-liblua"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_extract_package() {
	mkdir -p "$TERMUX_PKG_SRCDIR"
	cd "$TERMUX_PKG_SRCDIR"
	git clone https://github.com/vysheng/tg
	cd tg
	git checkout "$TERMUX_PKG_VERSION"
	git submodule update --init --recursive
	mv * ../
}

termux_step_post_configure() {
	sed -i -e 's@-I/usr/local/include@@g' -e 's@-I/usr/include@@g' Makefile
}

termux_step_make_install() {
	install -Dm700 bin/telegram-cli "$TERMUX_PREFIX"/bin/
	install -Dm600 tg-server.pub "$TERMUX_PREFIX"/etc/telegram-cli/server.pub
	install -Dm600 debian/telegram-cli.8 "$TERMUX_PREFIX"/share/man/man8/
}
