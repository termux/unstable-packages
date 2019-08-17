TERMUX_PKG_HOMEPAGE=https://mupdf.com/
TERMUX_PKG_DESCRIPTION="Lightweight PDF and XPS viewer (library only)"
TERMUX_PKG_LICENSE="AGPL-V3"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=1.15.0
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://mupdf.com/downloads/archive/mupdf-${TERMUX_PKG_VERSION}-source.tar.xz
TERMUX_PKG_SHA256=565036cf7f140139c3033f0934b72e1885ac7e881994b7919e15d7bee3f8ac4e
TERMUX_PKG_DEPENDS="freetype, harfbuzz, jbig2dec, libjpeg-turbo, openjpeg, zlib"
TERMUX_PKG_EXTRA_MAKE_ARGS="prefix=$TERMUX_PREFIX build=release libs"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_NO_DEVELSPLIT=true
TERMUX_PKG_KEEP_STATIC_LIBRARIES=true

termux_step_pre_configure() {
	rm -rf thirdparty/{freeglut,freetype,harfbuzz,jbig2dec,libjpeg,openjpeg,zlib}
	export USE_SYSTEM_LIBS=yes
	LDFLAGS+=" -llog"
}
