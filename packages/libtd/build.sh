TERMUX_PKG_HOMEPAGE=https://core.telegram.org/tdlib/
TERMUX_PKG_DESCRIPTION="Library for building Telegram clients"
TERMUX_PKG_LICENSE="BSL-1.0"
TERMUX_PKG_VERSION=1.6.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/tdlib/td/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9dce57a96f9d4bac8f99aab13ef5cbf6fed04b234a5d22dfa7ef7dce06ea43f8
TERMUX_PKG_DEPENDS="cmake, readline, openssl (>= 1.1.1), zlib, gperf"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_BUILD_TYPE=Release"
TERMUX_CMAKE_BUILD="Unix Makefiles"
TERMUX_PKG_HOSTBUILD=true

termux_step_host_build() {
        termux_setup_cmake
        cmake "-DCMAKE_BUILD_TYPE=Release" "$TERMUX_PKG_SRCDIR"
        cmake --build . --target prepare_cross_compiling
}
