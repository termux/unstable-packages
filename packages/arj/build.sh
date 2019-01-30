TERMUX_PKG_HOMEPAGE=http://arj.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Open-source version of arj archiver"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=3.10.22
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/arj/arj-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=589e4c9bccc8669e7b6d8d6fcd64e01f6a2c21fe10aad56a83304ecc3b96a7db
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_pre_configure() {
	cd gnu
	autoconf -f -i
	cd ..
	cat <<EOF > configure
#!/bin/sh
mkdir -p gnu
cd gnu
\$(dirname \$0)/gnu/configure "\$@"
EOF
	chmod +x configure
}


# ARJ appends archive of its help to its end. Unfortunately stripping and
# ELF cleaning remove it. So redo this addition and correct the
# ARJ self-checksum.
termux_step_post_massage () {
	build_subdir=linux-android
	if [ x$TERMUX_ARCH = xarm ]; then
		build_subdir=linux-androideabi
	fi
	$TERMUX_PKG_SRCDIR/$build_subdir/en/rs/tools/join bin/arj $TERMUX_PKG_SRCDIR/$build_subdir/en/rs/help.arj
	$TERMUX_PKG_SRCDIR/$build_subdir/en/rs/tools/postproc bin/arj
}
