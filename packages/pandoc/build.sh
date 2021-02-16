# Note: pandoc binary is not native and executed under QEMU.

TERMUX_PKG_HOMEPAGE=https://pandoc.org/
TERMUX_PKG_DESCRIPTION="Universal markup converter"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=2.11.4
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/jgm/pandoc/releases/download/$TERMUX_PKG_VERSION/pandoc-${TERMUX_PKG_VERSION}-linux-amd64.tar.gz
TERMUX_PKG_SHA256=b15ce6009ab833fb51fc472bf8bb9683cd2bd7f8ac948f3ddeb6b8f9a366d69a
TERMUX_PKG_DEPENDS="qemu-user-x86_64"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	sed \
		-e "s|@TERMUX_PREFIX@|$TERMUX_PREFIX|g" \
		-e "s|@BINARY@|pandoc|g" \
		"$TERMUX_PKG_BUILDER_DIR/wrapper.sh.in" \
			> "$TERMUX_PREFIX/bin/pandoc"
	chmod 700 "$TERMUX_PREFIX/bin/pandoc"
	install -Dm700 "./bin/pandoc" "$TERMUX_PREFIX/libexec/pandoc/pandoc"
	install -Dm600 "./share/man/man1/pandoc.1.gz" "$TERMUX_PREFIX/share/man/man1/pandoc.1.gz"
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
		#!$TERMUX_PREFIX/bin/sh
		echo
		echo "Package 'pandoc' uses x86_64 binary running under QEMU."
		echo "Do not post bug reports about it."
		echo
	EOF
}
