TERMUX_PKG_HOMEPAGE=https://github.com/michaeldv/mop
TERMUX_PKG_DESCRIPTION="Stock market tracker"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.2.0
TERMUX_PKG_SRCURL=https://github.com/mop-tracker/mop/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=cf11ce0967fc02aa6ed7852866973aeb66d2e5729ca1fe7997d9d58d64d8e04a

termux_step_make() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p $GOPATH/src/github.com/michaeldv
	ln -sf "$TERMUX_PKG_SRCDIR" $GOPATH/src/github.com/michaeldv/mop

	cd $GOPATH/src/github.com/michaeldv/mop
	go get -v
	cd ./cmd
	go build mop.go
}

termux_step_make_install() {
	install -Dm700 $GOPATH/src/github.com/michaeldv/mop/cmd/mop $TERMUX_PREFIX/bin/mop
}
