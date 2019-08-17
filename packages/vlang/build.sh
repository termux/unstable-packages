TERMUX_PKG_HOMEPAGE=https://github.com/vlang/v
TERMUX_PKG_DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
_COMMIT=7a3b5c20dd549f2f6022acfcefc376aeef9db903
TERMUX_PKG_VERSION=0.1.11-g${_COMMIT:0:6}
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/vlang/v/archive/${_COMMIT}.zip
TERMUX_PKG_SHA256=30cb901b969612c231e9f81b803c184bd05ac94975c61d000ba947564b8661ff
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	export VROOT="$HOME/.vlang"

	# Vlang doesn't seems to support cross-compilation so we need only to obtain
	# the generated C source file and compile it for target.
	rm -rf "$VROOT"
	make
}

termux_step_make_install() {
	$CC $CFLAGS $CPPFLAGS "$VROOT"/v.c -o "$TERMUX_PREFIX"/bin/v
}
