TERMUX_PKG_HOMEPAGE=https://github.com/MaskRay/ccls
TERMUX_PKG_DESCRIPTION="C/C++/ObjC language server"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=0.20190823.4
TERMUX_PKG_SRCURL=https://github.com/MaskRay/ccls/archive/0.20190823.4.tar.gz
TERMUX_PKG_SHA256=19f394b69d70415d3be9a11a030e0bb28ddc2b654cbfa35f4570096935f9f536
TERMUX_PKG_DEPENDS="libllvm"
TERMUX_PKG_BUILD_DEPENDS="rapidjson, libllvm-static"
termux_step_pre_configure() {
	touch /data/data/com.termux/files/usr/bin/clang-import-test
}

termux_step_post_make_install() {
	rm /data/data/com.termux/files/usr/bin/clang-import-test
}
