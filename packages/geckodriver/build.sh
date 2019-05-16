TERMUX_PKG_HOMEPAGE=https://github.com/mozilla/geckodriver
TERMUX_PKG_DESCRIPTION="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.24.0
TERMUX_PKG_SRCURL=https://github.com/mozilla/geckodriver/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e6f86b3b6411f078c0a762f978c00ee99926463036a68be01d111bd91f25340e
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_post_make_install() {
	install -Dm700 \
		"$TERMUX_PKG_SRCDIR/target/$CARGO_TARGET_NAME"/release/geckodriver \
		"$TERMUX_PREFIX"/bin/
}
