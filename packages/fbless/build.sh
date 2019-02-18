TERMUX_PKG_HOMEPAGE=http://pybookreader.narod.ru/misc.html
TERMUX_PKG_DESCRIPTION="Console FictionBook reader"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.2.2
TERMUX_PKG_REVISION=1
_COMMIT=7db0ee1193657ff79ae478e2a365e058a432f02b
TERMUX_PKG_SRCURL=https://github.com/ashinkarov/fbless/archive/${_COMMIT}.zip
TERMUX_PKG_SHA256=05bebf23f01ab7b5bc29f97e6b63f99f03b35027ca8392a40491101f8aa28bf8
TERMUX_PKG_DEPENDS="ncurses, python2"
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_make_install() {
	export PYTHONPATH="$TERMUX_PREFIX/lib/python2.7/site-packages/"
	python2.7 setup.py install --prefix="$TERMUX_PREFIX" --force
}
