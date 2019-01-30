TERMUX_PKG_HOMEPAGE=http://links.twibright.com
TERMUX_PKG_DESCRIPTION="Links is a text and graphics mode WWW browser"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.18
TERMUX_PKG_SRCURL=http://links.twibright.com/download/links-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ad33d0abfec9627a5ddc34740ec69f1dbec457528581bf23fee4fdcaa90f2332
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS=" --mandir=$TERMUX_PREFIX/share/man"
