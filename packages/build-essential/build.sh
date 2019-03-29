TERMUX_PKG_HOMEPAGE=https://github.com/termux/termux-packages
TERMUX_PKG_DESCRIPTION="A metapackage that installs essential development tools"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.0
TERMUX_PKG_METAPACKAGE=yes
TERMUX_PKG_PLATFORM_INDEPENDENT=yes

#
# autoconf, automake, cmake, make, ninja - utilities for common build systems.
#
# bc, gperf - required in certain cases.
#
# bison, flex - used in complex projects and interpreters.
#
# bzip2, coreutils, diffutils, findutils, gawk, grep, gzip, procps, psmisc,
#
# git - must have utility for working with Github and other Git hostings.
#
# sed, tar - we may need complete versions of the basic utilities instead of ones
# from busybox.
#
TERMUX_PKG_DEPENDS="autoconf, automake, bc, bison, bzip2, clang, cmake, coreutils, diffutils, ed, file, findutils, gawk, gdb, git, gperf, grep, gzip, libtool, m4, make, ninja, patch, pkg-config, procps, psmisc, sed, tar, xz-utils"

# Other packages that may be interesting.
TERMUX_PKG_SUGGESTS="cargo, golang, nodejs, python-dev, python2-dev, ruby-dev"
