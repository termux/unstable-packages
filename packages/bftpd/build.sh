TERMUX_PKG_HOMEPAGE=http://bftpd.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Small, easy-to-configure FTP server"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=5.2
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/sourceforge/bftpd/bftpd-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=7e6259f8eada88ef598df4c1517fa260c798ad2361d9b4627b97ff2125ddaa4e
TERMUX_PKG_DEPENDS="libcrypt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_CONFFILES="etc/bftpd.conf"
TERMUX_PKG_RM_AFTER_INSTALL="var/log/bftpd.log"
