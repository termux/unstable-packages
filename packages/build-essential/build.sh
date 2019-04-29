TERMUX_PKG_HOMEPAGE=https://github.com/termux/termux-packages
TERMUX_PKG_DESCRIPTION="A metapackage that installs essential development tools"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.0
TERMUX_PKG_METAPACKAGE=yes
TERMUX_PKG_PLATFORM_INDEPENDENT=yes

#
# Common utilities for various build systems:
#
#   autoconf, automake, bison, clang, cmake, flex, gperf, libtool, m4, make, ninja, pkg-config
#
# These packages replace busybox's applets:
#
#   bc, bzip2, coreutils, diffutils, ed, findutils, gawk, grep, gzip, lzip, lzop, patch, procps, psmisc, sed, tar, xz-utils
#
# Useful for debugging.
#
#   file, gdb, ltrace, strace
#
# Version control systems.
#
#   git, subversion
#

TERMUX_PKG_DEPENDS="autoconf, automake, bison, clang, cmake, flex, gperf, libtool, m4, make, ninja, pkg-config, bc, bzip2, coreutils, diffutils, ed, findutils, gawk, grep, gzip, lzip, lzop, patch, procps, psmisc, sed, tar, xz-utils, file, gdb, ltrace, strace, git, subversion"

# Other packages that may be interesting.
TERMUX_PKG_SUGGESTS="cargo, golang, nodejs, patchelf, proot, python-dev, python2-dev, ruby-dev"

termux_step_post_massage() {
	cd "$TERMUX_PKG_MASSAGEDIR"
	rm -rf data
}
