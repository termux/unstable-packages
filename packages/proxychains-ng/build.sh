TERMUX_PKG_HOMEPAGE=https://github.com/rofl0r/proxychains-ng
TERMUX_PKG_DESCRIPTION="a preloader which hooks calls to sockets in dynamically linked programs and redirects it through one or more socks/http proxies. It is a kind of proxifier."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=4.13
TERMUX_PKG_SRCURL=https://github.com/rofl0r/proxychains-ng/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ff15295efc227fec99c2b8131ad532e83e833a02470c7a48ae7e7f131e1b08bc
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_post_make_install() {
	# Remove conf file from previous build, otherwise nothing will be done and it won't be included in the package
	rm -f $TERMUX_PREFIX/etc/proxychains.conf
	make install-config
}
