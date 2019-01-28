TERMUX_PKG_HOMEPAGE=https://www.soimort.org/translate-shell
TERMUX_PKG_DESCRIPTION="Command-line translator using Google Translate, Bing Translator, Yandex.Translate, etc."
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_VERSION=0.9.6.9
TERMUX_PKG_SRCURL=https://github.com/soimort/translate-shell/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=05705c541a5d3c34e0df954a799371a0466c85de26400e632672e073767051b4
TERMUX_PKG_DEPENDS="bash, gawk"
TERMUX_PKG_EXTRA_MAKE_ARGS="PREFIX=$TERMUX_PREFIX"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
