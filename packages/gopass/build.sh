TERMUX_PKG_HOMEPAGE=https://github.com/gopasspw/gopass
TERMUX_PKG_DESCRIPTION="The slightly more awesome standard unix password manager for teams."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.8.4
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/gopasspw/gopass/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=314b317c49ee7f8c59758ab82cf5f6942ce9179c97e53f0f952741dbd0e5471a
TERMUX_PKG_DEPENDS="git, gnupg"
TERMUX_PKG_SUGGESTS="termux-api"

termux_step_make() {
	termux_setup_golang
	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p ./src
	mv "$TERMUX_PKG_SRCDIR"/vendor/* src/
	mkdir -p ./src/github.com/gopasspw
	ln -sf "$TERMUX_PKG_SRCDIR" ./src/github.com/gopasspw/gopass

	# Build gopass for host so we can generate completion for shells.
	GOOS=linux GOARCH=amd64 CC=gcc LD=gcc make -C ./src/github.com/gopasspw/gopass build completion
	make -C ./src/github.com/gopasspw/gopass install PREFIX=$TERMUX_PREFIX

	# Finally build gopass for target.
	rm -f ./src/github.com/gopasspw/gopass/gopass
	make -C ./src/github.com/gopasspw/gopass build
	install -Dm700 ./src/github.com/gopasspw/gopass/gopass $TERMUX_PREFIX/bin/gopass
}
