TERMUX_PKG_HOMEPAGE=https://geth.ethereum.org/
TERMUX_PKG_DESCRIPTION="Go implementation of the Ethereum protocol"
TERMUX_PKG_LICENSE="LGPL-3.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.8.22
TERMUX_PKG_SRCURL=https://github.com/ethereum/go-ethereum/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=8cd1d3bf8bcea7fa6449eef56d9103eca9403aae74f839c1f1f89eaf6989fe01

termux_step_make() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p $GOPATH/src/github.com/ethereum
	ln -sf $TERMUX_PKG_SRCDIR $GOPATH/src/github.com/ethereum/go-ethereum

	cd $GOPATH/src/github.com/ethereum/go-ethereum
	for cmd in geth abigen bootnode ethkey evm rlpdump swarm puppeth; do
		pushd ./cmd/$cmd
		go build
		popd
	done
	unset cmd
}

termux_step_make_install() {
	for cmd in geth abigen bootnode ethkey evm rlpdump swarm puppeth; do
		install -Dm700 $TERMUX_PKG_SRCDIR/cmd/$cmd/$cmd $TERMUX_PREFIX/bin/
	done
}
