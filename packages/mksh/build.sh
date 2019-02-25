TERMUX_PKG_HOMEPAGE=https://www.mirbsd.org/mksh.htm
TERMUX_PKG_DESCRIPTION="The MirBSD Korn Shell - an enhanced version of the public domain ksh"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=56.c
TERMUX_PKG_SRCURL=https://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R${TERMUX_PKG_VERSION/./}.tgz
TERMUX_PKG_SHA256=dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	sh Build.sh -r
}

termux_step_make_install() {
	install -Dm700 mksh "$TERMUX_PREFIX"/bin/mksh
	install -Dm600 mksh.1 "$TERMUX_PREFIX"/share/man/man1/mksh.1
}
