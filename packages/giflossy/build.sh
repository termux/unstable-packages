TERMUX_PKG_HOMEPAGE=https://github.com/kornelski/giflossy
TERMUX_PKG_DESCRIPTION="Lossy GIF compressor"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.91
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/kornelski/giflossy/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=b97f6aadf163ff5dd96ad1695738ad3d5aa7f1658baed8665c42882f11d9ab22
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-gifview"

TERMUX_PKG_CONFLICTS="gifsicle"
TERMUX_PKG_REPLACES="gifsicle"
TERMUX_PKG_PROVIDES="gifsicle"

termux_step_pre_configure() {
	./bootstrap.sh
}
