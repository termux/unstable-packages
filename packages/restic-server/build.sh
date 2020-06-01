TERMUX_PKG_HOMEPAGE=https://restic.net/
TERMUX_PKG_DESCRIPTION="Restic's REST backend API server"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.9.8
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/restic/rest-server/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2080012981c81b788f0aea302f5126b0b2ed89f0bdc9104166289ca167c38c75
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	_GOARCH="${GOARCH}"
	unset GOOS GOARCH
	go run build.go \
		--enable-cgo \
		--goos android \
		--goarch "${_GOARCH}"
}

termux_step_make_install() {
	install -Dm755 rest-server "${TERMUX_PREFIX}/bin/rest-server"
}
