# Note: pandoc binary is not native and executed under QEMU.

TERMUX_PKG_HOMEPAGE=https://pandoc.org/
TERMUX_PKG_DESCRIPTION="Universal markup converter"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=2.9.2.1
TERMUX_PKG_SRCURL=https://github.com/jgm/pandoc/releases/download/$TERMUX_PKG_VERSION/pandoc-${TERMUX_PKG_VERSION}-linux-amd64.tar.gz
TERMUX_PKG_SHA256=5b61a981bd2b7d48c1b4ba5788f1386631f97e2b46d0d1f1a08787091b4b0cf8
TERMUX_PKG_DEPENDS="qemu-user-x86_64"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	local file
	for file in pandoc pandoc-citeproc; do
		sed \
			-e "s|@TERMUX_PREFIX@|$TERMUX_PREFIX|g" \
			-e "s|@BINARY@|$file|g" \
			"$TERMUX_PKG_BUILDER_DIR/wrapper.sh.in" \
				> "$TERMUX_PREFIX/bin/$file"

		chmod 700 "$TERMUX_PREFIX/bin/$file"

		install -Dm700 "./bin/$file" "$TERMUX_PREFIX/libexec/pandoc/$file"
		install -Dm600 "./share/man/man1/$file.1.gz" "$TERMUX_PREFIX/share/man/man1/$file.1.gz"
	done
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
