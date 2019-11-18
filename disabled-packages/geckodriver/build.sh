TERMUX_PKG_HOMEPAGE=https://github.com/mozilla/geckodriver
TERMUX_PKG_DESCRIPTION="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.25.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/mozilla/geckodriver/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=9ba9b1be1a2e47ddd11216ce863903853975a4805e72b9ed5da8bcbcaebbcea9
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_make_install() {
	install -Dm700 \
		"$TERMUX_PKG_SRCDIR/target/$CARGO_TARGET_NAME"/release/geckodriver \
		"$TERMUX_PREFIX"/bin/
}
