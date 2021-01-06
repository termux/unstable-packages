TERMUX_PKG_HOMEPAGE=https://github.com/MaskRay/ccls
TERMUX_PKG_DESCRIPTION="C/C++/ObjC language server"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=0.20201025
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/MaskRay/ccls/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=1470797b2c1a466e2d8a069efd807aac6fefdef8a556e1edf2d44f370c949221
TERMUX_PKG_DEPENDS="libllvm"
TERMUX_PKG_BUILD_DEPENDS="rapidjson, libllvm-static"

termux_step_pre_configure() {
	touch $TERMUX_PREFIX/bin/{clang-import-test,clang-offload-wrapper}
}

termux_step_post_make_install() {
	rm $TERMUX_PREFIX/bin/{clang-import-test,clang-offload-wrapper}
}
