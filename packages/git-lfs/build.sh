TERMUX_PKG_HOMEPAGE=https://git-lfs.github.com/
TERMUX_PKG_DESCRIPTION="Git extension for versioning large files"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.6.1
TERMUX_PKG_SRCURL=https://github.com/git-lfs/git-lfs/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e17cd9d4e66d1116be32f7ddc7e660c7f8fabbf510bc01b01ec15a22dd934ead

termux_step_make() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p $GOPATH/github.com/git-lfs
	ln -sf $TERMUX_PKG_SRCDIR $GOPATH/github.com/git-lfs/git-lfs

	cd $GOPATH/github.com/git-lfs/git-lfs
	go build git-lfs.go
}

termux_step_make_install() {
	install -Dm700 $GOPATH/github.com/git-lfs/git-lfs/git-lfs $TERMUX_PREFIX/bin/git-lfs
}
