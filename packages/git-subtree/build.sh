TERMUX_PKG_HOMEPAGE=https://git-scm.com/
TERMUX_PKG_DESCRIPTION="Git-Subtree support for Git"
TERMUX_PKG_LICENSE="GPL-2.0"
# less is required as a pager for git log, and the busybox less does not handle used escape sequences.
TERMUX_PKG_DEPENDS="git, libcurl, less, openssl, pcre2"
TERMUX_PKG_VERSION=2.20.1
TERMUX_PKG_REVISION=2
TERMUX_PKG_SHA256=9d2e91e2faa2ea61ba0a70201d023b36f54d846314591a002c610ea2ab81c3e9
TERMUX_PKG_SRCURL=https://www.kernel.org/pub/software/scm/git/git-$TERMUX_PKG_VERSION.tar.xz
## This requires a working $TERMUX_PREFIX/bin/sh on the host building:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
ac_cv_fread_reads_directories=yes
ac_cv_header_libintl_h=no
ac_cv_snprintf_returns_bogus=no
--with-curl
--without-tcltk
--with-shell=$TERMUX_PREFIX/bin/sh"

# expat is only used by git-http-push for remote lock management over DAV, so disable:
# NO_INSTALL_HARDLINKS to use symlinks instead of hardlinks (which does not work on Android M):
TERMUX_PKG_EXTRA_MAKE_ARGS="
NO_NSEC=1
NO_GETTEXT=1
NO_EXPAT=1
NO_INSTALL_HARDLINKS=1
PERL_PATH=$TERMUX_PREFIX/bin/perl
USE_LIBPCRE2=1"

TERMUX_PKG_BUILD_IN_SRC="yes"

termux_step_pre_configure() {
	# Setup perl so that the build process can execute it:
	rm -f $TERMUX_PREFIX/bin/perl
	ln -s $(which perl) $TERMUX_PREFIX/bin/perl

	# Force fresh perl files (otherwise files from earlier builds
	# remains without bumped modification times, so are not picked
	# up by the package):
	rm -Rf $TERMUX_PREFIX/share/git-perl

	# Fixes build if utfcpp is installed:
	CPPFLAGS="-I$TERMUX_PKG_SRCDIR $CPPFLAGS"
}

termux_step_make() {
	make -C contrib/subtree \
		-j $TERMUX_MAKE_PROCESSES \
		$TERMUX_PKG_EXTRA_MAKE_ARGS
}

termux_step_make_install() {
	make -C contrib/subtree install $TERMUX_PKG_EXTRA_MAKE_ARGS
}

termux_step_post_make_install() {
	# Installing man requires asciidoc and xmlto, so git uses separate make targets for man pages
	make -C contrib/subtree install-man

	# Remove the build machine perl setup in termux_step_pre_configure to avoid it being packaged:
	rm $TERMUX_PREFIX/bin/perl

	# Remove clutter:
	rm -Rf $TERMUX_PREFIX/lib/*-linux*/perl
}
