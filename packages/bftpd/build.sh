TERMUX_PKG_HOMEPAGE=http://bftpd.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Small, easy-to-configure FTP server"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=5.4
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/sourceforge/bftpd/bftpd-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ef0ee701eacb103c455d0f7644d4313ccae89ed4d8d8de1e9a72f231444ecda5
TERMUX_PKG_DEPENDS="libcrypt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_CONFFILES="etc/bftpd.conf"
TERMUX_PKG_RM_AFTER_INSTALL="var/log/bftpd.log"
