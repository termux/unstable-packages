TERMUX_PKG_HOMEPAGE=https://github.com/MaskRay/ccls
TERMUX_PKG_DESCRIPTION="C/C++/ObjC language server"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=0.20190823.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/MaskRay/ccls/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=83dd45120e9674319f91e4379013831e124c0858e050bbc3521e3f8aebe5c95b
TERMUX_PKG_DEPENDS="libllvm"
TERMUX_PKG_BUILD_DEPENDS="rapidjson, libllvm-static"

termux_step_pre_configure() {
	touch $TERMUX_PREFIX/bin/clang-import-test
}

termux_step_post_make_install() {
	rm $TERMUX_PREFIX/bin/clang-import-test
}
