TERMUX_PKG_HOMEPAGE=http://openfec.org
TERMUX_PKG_DESCRIPTION="Application-Level Forward Erasure Correction implementation library"
TERMUX_PKG_LICENSE="CeCILL-C"
TERMUX_PKG_LICENSE_FILE="LICENCE_CeCILL-C_V1-en.txt LICENCE_CeCILL-C_V1-en.txt"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=1.4.2.3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/roc-project/openfec/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=5cc47e403a62afcb1f0423390d6d1a370f0bf969aa01b79fdfd1ad4852b59aff

termux_step_make_install() {
	install -Dm600 "$TERMUX_PKG_SRCDIR/bin/Release/libopenfec.so" "$TERMUX_PREFIX/lib/libopenfec.so"

	cd $TERMUX_PKG_SRCDIR/src
	local include; for include in $(find . -type f -iname \*.h | sed 's@^\./@@'); do
		install -Dm600 "$include" "$TERMUX_PREFIX"/include/"$include"
	done
}
