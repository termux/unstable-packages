## I'm unsure that HashCat will work...
## Though, it worked on Samsung Galaxy S7 with Android 6
## ROM, but after update to Android 7 and higher it no longer
## works.

TERMUX_PKG_HOMEPAGE=https://hashcat.net/hashcat
TERMUX_PKG_DESCRIPTION="World's fastest and most advanced password recovery utility"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=4.0.0
TERMUX_PKG_SRCURL=https://github.com/hashcat/hashcat/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=e14c169d6966830e7b7423e17e678f3333e074ec50dae50bdde40e8e0e8658be
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_post_configure() {
	mkdir -p $TERMUX_PREFIX/include/CL
	mv ./cl.h $TERMUX_PREFIX/include/CL/
	mv ./cl_platform.h $TERMUX_PREFIX/include/CL/
}
