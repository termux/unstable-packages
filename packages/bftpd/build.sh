TERMUX_PKG_HOMEPAGE=http://bftpd.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Small, easy-to-configure FTP server"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=5.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://kumisystems.dl.sourceforge.net/project/bftpd/bftpd/bftpd-${TERMUX_PKG_VERSION}/bftpd-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=1094f25afc23c24a1b63db7ebe9f9b72bba4bc3b9245d13d8054ad724ea37aa2
TERMUX_PKG_DEPENDS="libcrypt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_CONFFILES="etc/bftpd.conf"
TERMUX_PKG_RM_AFTER_INSTALL="var/log/bftpd.log"
