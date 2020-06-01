TERMUX_PKG_HOMEPAGE=https://dev.lovelyhq.com/libburnia
TERMUX_PKG_DESCRIPTION="Frontend for libraries libburn and libisofs"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=1.5.2
TERMUX_PKG_SRCURL=http://files.libburnia-project.org/releases/libisoburn-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=cc720bc9511d8e0b09365e2c8b0e40817986be308cd96ca2705c807c955590ec
TERMUX_PKG_DEPENDS="libburn, libisofs, readline"
TERMUX_PKG_CONFLICTS="xorriso"
TERMUX_PKG_BREAKS="libisoburn-dev"
TERMUX_PKG_REPLACES="libisoburn-dev"

# We don't have tk.
TERMUX_PKG_RM_AFTER_INSTALL="bin/xorriso-tcltk"
