# Requires patching.

TERMUX_PKG_HOMEPAGE=https://github.com/erikd/libsamplerate
TERMUX_PKG_DESCRIPTION="A library for perfroming sample rate conversion of audio data"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.1.9
TERMUX_PKG_SRCURL=http://www.mega-nerd.com/SRC/libsamplerate-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1
TERMUX_PKG_DEPENDS="libsndfile"
TERMUX_PKG_BUILD_IN_SRC=yes
