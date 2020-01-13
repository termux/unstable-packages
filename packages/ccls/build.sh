TERMUX_PKG_HOMEPAGE=https://github.com/MaskRay/ccls
TERMUX_PKG_DESCRIPTION="C/C++/ObjC language server"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=0.20190823.5
TERMUX_PKG_SRCURL=https://github.com/MaskRay/ccls/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=6f39fa5ce79c1682973811ce2409718710bfef6008f94f96277393e6846bd76c
TERMUX_PKG_DEPENDS="libllvm"
TERMUX_PKG_BUILD_DEPENDS="rapidjson, libllvm-static"
termux_step_pre_configure() {
	touch /data/data/com.termux/files/usr/bin/clang-import-test
}

termux_step_post_make_install() {
	rm /data/data/com.termux/files/usr/bin/clang-import-test
}
