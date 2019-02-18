TERMUX_PKG_HOMEPAGE=http://e2fsprogs.sourceforge.net
TERMUX_PKG_DESCRIPTION="EXT 2/3/4 filesystem utilities"
TERMUX_PKG_LICENSE="GPL-2.0, LGPL-2.0, MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.44.5
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v$TERMUX_PKG_VERSION/e2fsprogs-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=ba5eb3069d69160d96818bb9700de9ab5a8458d9add1fd85d427c0000d34c5b9
TERMUX_PKG_KEEP_STATIC_LIBRARIES=true
TERMUX_PKG_INCLUDE_IN_DEVPACKAGE="lib/*.a"
TERMUX_PKG_CONFFILES="etc/mke2fs.conf"

## util-linux provides libblkid
TERMUX_PKG_DEPENDS="libuuid, util-linux"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--sbindir=${TERMUX_PREFIX}/bin
--enable-symlink-install
--enable-relative-symlinks
--disable-defrag
--disable-e2initrd-helper
--disable-libuuid
--disable-libblkid
--disable-uuidd"

TERMUX_PKG_RM_AFTER_INSTALL="
bin/compile_et
bin/mk_cmds
share/et
share/ss
share/man/man1/compile_et.1
share/man/man1/mk_cmds.1"

termux_step_make_install() {
	make install install-libs
	install -Dm600 \
		"$TERMUX_PKG_SRCDIR"/misc/mke2fs.conf.in \
		"$TERMUX_PREFIX"/etc/mke2fs.conf
}
