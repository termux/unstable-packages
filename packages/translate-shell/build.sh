TERMUX_PKG_HOMEPAGE=https://www.soimort.org/translate-shell
TERMUX_PKG_DESCRIPTION="Command-line translator using Google Translate, Bing Translator, Yandex.Translate, etc."
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=0.9.6.10
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/soimort/translate-shell/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=18c23af071ab5ae8653a5d0d1c50784b32c4a51efd9e05da07f888a6a6428958
TERMUX_PKG_DEPENDS="bash, gawk"
TERMUX_PKG_EXTRA_MAKE_ARGS="PREFIX=$TERMUX_PREFIX"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
