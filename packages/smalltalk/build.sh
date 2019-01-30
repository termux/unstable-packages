TERMUX_PKG_HOMEPAGE=http://smalltalk.gnu.org/
TERMUX_PKG_DESCRIPTION="A free implementation of the Smalltalk-80 language"
TERMUX_PKG_LICENSE="GPL-2.0, LGPL-2.1"
TERMUX_PKG_MAINTAINER="Henrik Grimler @Grimler91"
TERMUX_PKG_VERSION=3.2.5
TERMUX_PKG_SRCURL=ftp://ftp.gnu.org/gnu/smalltalk/smalltalk-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=819a15f7ba8a1b55f5f60b9c9a58badd6f6153b3f987b70e7b167e7755d65acc
TERMUX_PKG_DEPENDS="glib, libltdl, libffi, libsigsegv, readline"
# pcre needed by glib, libtool contains ltdl.h
TERMUX_PKG_BUILD_DEPENDS="pcre, libtool"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-gtk"
TERMUX_PKG_HOSTBUILD=yes

termux_step_host_build () {
	# Building bloxtk on archlinux fails with this error: https://bugs.gentoo.org/582936
	$TERMUX_PKG_SRCDIR/configure --disable-gtk --disable-bloxtk
	make
}

termux_step_pre_configure () {
	export LD_LIBRARY_PATH=$TERMUX_PKG_HOSTBUILD_DIR/libgst/.libs
	sed -i "s%@TERMUX_PKG_HOSTBUILD_DIR@%$TERMUX_PKG_HOSTBUILD_DIR%g" $TERMUX_PKG_SRCDIR/Makefile.in
}
