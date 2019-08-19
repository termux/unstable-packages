TERMUX_PKG_HOMEPAGE=https://www.sno.phy.queensu.ca/~phil/exiftool/index.html
TERMUX_PKG_DESCRIPTION="Utility for reading, writing and editing meta information in a wide variety of files."
TERMUX_PKG_LICENSE="Artistic-License-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=11.62
TERMUX_PKG_SRCURL="https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=60c11ca7ab19d069582dd950da97e4e574fea83b4c14175a5a2418d8942c4731
TERMUX_PKG_DEPENDS="perl"

termux_step_make_install() {
	install -Dm700 $TERMUX_PKG_SRCDIR/exiftool $TERMUX_PREFIX/bin/exiftool
	find $TERMUX_PKG_SRCDIR/lib -name "*.pod" -delete
	mkdir -p $TERMUX_PREFIX/lib/perl5/site_perl/5.30.0
	rm -rf $TERMUX_PREFIX/lib/perl5/site_perl/5.30.0/{Image,File}
	cp -a $TERMUX_PKG_SRCDIR/lib/{Image,File} $TERMUX_PREFIX/lib/perl5/site_perl/5.30.0/
}
