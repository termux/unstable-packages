TERMUX_PKG_HOMEPAGE=https://www.haproxy.org/
TERMUX_PKG_DESCRIPTION="The Reliable, High Performance TCP/HTTP Load Balancer"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.9.4
TERMUX_PKG_SRCURL=https://haproxy.org/download/${TERMUX_PKG_VERSION%.*}/src/haproxy-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=8483fe12b30256f83d542b3f699e165d8f71bf2dfac8b16bb53716abce4ba74f
TERMUX_PKG_EXTRA_MAKE_ARGS="TARGET=generic"
TERMUX_PKG_BUILD_IN_SRC=yes
