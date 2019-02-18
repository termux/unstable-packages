TERMUX_PKG_HOMEPAGE=https://github.com/sahlberg/libnfs
TERMUX_PKG_DESCRIPTION="NFS client library"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=3.0.0
TERMUX_PKG_SRCURL=https://github.com/sahlberg/libnfs/archive/libnfs-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=445d92c5fc55e4a5b115e358e60486cf8f87ee50e0103d46a02e7fb4618566a5

termux_step_pre_configure() {
	autoreconf -fi
}
