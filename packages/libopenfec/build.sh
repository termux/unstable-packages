TERMUX_PKG_HOMEPAGE=http://openfec.org
TERMUX_PKG_DESCRIPTION="Application-Level Forward Erasure Correction implementation library"
TERMUX_PKG_LICENSE="CeCCIL-C"
TERMUX_PKG_LICENSE_FILE="LICENCE_CeCILL-C_V1-en.txt LICENCE_CeCILL-C_V1-en.txt"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=1.4.2.3
TERMUX_PKG_SRCURL=https://github.com/roc-project/openfec/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=5cc47e403a62afcb1f0423390d6d1a370f0bf969aa01b79fdfd1ad4852b59aff

# Cmake definition
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DTERMUX:STRING=TERMUX
"

termux_step_make_install() {
    install -Dm644 "$TERMUX_PKG_SRCDIR/bin/Release/libopenfec.so" "$TERMUX_PREFIX/lib/libopenfec.so"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/eperftool" "$TERMUX_PREFIX/bin/eperftool"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/simple_server" "$TERMUX_PREFIX/bin/simple_server"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/simple_client" "$TERMUX_PREFIX/bin/simple_client"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/test_code_params" "$TERMUX_PREFIX/bin/test_code_params"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/test_create_instance" "$TERMUX_PREFIX/bin/test_create_instance"
    install -Dm755 "$TERMUX_PKG_SRCDIR/bin/Release/test_encoder_instance" "$TERMUX_PREFIX/bin/test_encoder_instance"
}
