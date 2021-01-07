TERMUX_PKG_HOMEPAGE=https://github.com/MaskRay/ccls
TERMUX_PKG_DESCRIPTION="C/C++/ObjC language server"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=0.20201219
TERMUX_PKG_SRCURL=https://github.com/MaskRay/ccls/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=edd3435bc7e55d9e5dc931932f9c98275a6a28d1ab1f66416110e029f3f2882a
TERMUX_PKG_DEPENDS="libllvm"
TERMUX_PKG_BUILD_DEPENDS="rapidjson, libllvm-static"

termux_step_pre_configure() {
	touch $TERMUX_PREFIX/bin/{clang-import-test,clang-offload-wrapper}
}

termux_step_post_make_install() {
	rm $TERMUX_PREFIX/bin/{clang-import-test,clang-offload-wrapper}
}
