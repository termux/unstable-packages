TERMUX_PKG_HOMEPAGE=https://github.com/RadhiFadlillah/shiori
TERMUX_PKG_DESCRIPTION="Simple bookmark manager"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=1.0
TERMUX_PKG_REVISION=3
TERMUX_PKG_SKIP_SRC_EXTRACT=true

termux_step_make_install() {
	termux_setup_golang
	export GOPATH=$TERMUX_PKG_BUILDDIR

	go get -d github.com/RadhiFadlillah/shiori
	cd "$GOPATH"/src/github.com/RadhiFadlillah/shiori
	git checkout "v$TERMUX_PKG_VERSION"
	git submodule update --init --recursive

	go build -o "$TERMUX_PREFIX"/bin/shiori main.go
}
