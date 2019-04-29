# Note: pandoc binary is not native and executed under QEMU.

TERMUX_PKG_HOMEPAGE=https://pandoc.org/
TERMUX_PKG_DESCRIPTION="Universal markup converter"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.7.2
TERMUX_PKG_SRCURL=https://github.com/jgm/pandoc/releases/download/$TERMUX_PKG_VERSION/pandoc-${TERMUX_PKG_VERSION}-linux.tar.gz
TERMUX_PKG_SHA256=6741f73e37a900deee56bc2dc71c2893fb28e0961557db36eb029368de5183c2
TERMUX_PKG_DEPENDS="qemu-user-x86_64"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_make_install() {
	local file
	for file in pandoc pandoc-citeproc; do
		sed \
			-e "s|@TERMUX_PREFIX@|$TERMUX_PREFIX@|g" \
			-e "s|@BINARY@|$file|g" \
			"$TERMUX_PKG_BUILDER_DIR/wrapper.sh.in" \
				> "$TERMUX_PREFIX/bin/$file"

		chmod 700 "$TERMUX_PREFIX/bin/$file"

		install -Dm700 "./bin/$file" "$TERMUX_PREFIX/libexec/pandoc/$file"
		install -Dm600 "./share/man/man1/$file.1.gz" "$TERMUX_PREFIX/share/man/man1/$file.1.gz"
	done
}
