TERMUX_PKG_HOMEPAGE=https://www.aptly.info
TERMUX_PKG_DESCRIPTION="A Swiss Army knife for Debian repository management."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=1.3.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/aptly-dev/aptly/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=4d993dd790345e54dd963467a475ae160a7133bae7ee42844f15d5e82c1fb36e

termux_step_make() {
	termux_setup_golang
	export GOPATH=$TERMUX_PKG_BUILDDIR

	mkdir -p "$GOPATH"/src/github.com/aptly-dev/
	cp -a "$TERMUX_PKG_SRCDIR" "$GOPATH"/src/github.com/aptly-dev/aptly
	cd "$GOPATH"/src/github.com/aptly-dev/aptly

	make install VERSION=$TERMUX_PKG_VERSION
}

termux_step_make_install() {
	install -Dm700 \
		"$GOPATH"/bin/${GOOS}_${GOARCH}/aptly \
		"$TERMUX_PREFIX"/bin/aptly

	install -Dm600 \
		"$TERMUX_PKG_SRCDIR"/man/aptly.1 \
		"$TERMUX_PREFIX"/share/man/man1/aptly.1
}
