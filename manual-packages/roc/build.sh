## * Requires pulseaudio build and source directory.
## * Uses scons build system which is not good at cross-compiling.

TERMUX_PKG_HOMEPAGE=https://roc-project.github.io
TERMUX_PKG_DESCRIPTION="Roc real-time streaming over the network"
TERMUX_PKG_LICENSE="LGPL-2.0, MPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.1.1
TERMUX_PKG_SRCURL=https://github.com/roc-project/roc/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=2aa63061b586a5f16cfcb0bfe304015a6effdcb373513cb62e76283bde7dd104
TERMUX_PKG_DEPENDS="libltdl, libopenfec, libpulseaudio, libuv"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	SCONS_CONFIGURE_ARGS=""
	SCONS_CONFIGURE_ARGS+=" --prefix=$TERMUX_PREFIX"
	SCONS_CONFIGURE_ARGS+=" --host=$TERMUX_HOST_PLATFORM"
	SCONS_CONFIGURE_ARGS+=" --compiler=clang"
	SCONS_CONFIGURE_ARGS+=" --disable-tools"
	SCONS_CONFIGURE_ARGS+=" --disable-tests"
	SCONS_CONFIGURE_ARGS+=" --disable-examples"
	SCONS_CONFIGURE_ARGS+=" --disable-doc"
	SCONS_CONFIGURE_ARGS+=" --disable-sox"
	#SCONS_CONFIGURE_ARGS+=" --disable-openfec"
	SCONS_CONFIGURE_ARGS+=" --enable-pulseaudio-modules"
	SCONS_CONFIGURE_ARGS+=" --with-openfec-includes=$TERMUX_PREFIX/include/openfec"
	SCONS_CONFIGURE_ARGS+=" --with-pulseaudio=$TERMUX_TOPDIR/libpulseaudio/src"
	SCONS_CONFIGURE_ARGS+=" --with-pulseaudio-build-dir=$TERMUX_TOPDIR/libpulseaudio/build"

	scons $SCONS_CONFIGURE_ARGS
}

termux_step_make_install() {
	scons $SCONS_CONFIGURE_ARGS install
}
