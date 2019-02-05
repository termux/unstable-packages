TERMUX_PKG_HOMEPAGE=http://www.gnu.org/software/guile/
TERMUX_PKG_DESCRIPTION="Portable, embeddable Scheme implementation written in C. (legacy branch)"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_API_LEVEL=23
TERMUX_PKG_VERSION=1.8.8
TERMUX_PKG_SRCURL=ftp://ftp.gnu.org/pub/gnu/guile/guile-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=c3471fed2e72e5b04ad133bbaaf16369e8360283679bcf19800bc1b381024050
TERMUX_PKG_DEPENDS="libgmp, libltdl, ncurses"
TERMUX_PKG_HOSTBUILD=yes

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--program-suffix=1.8
--disable-error-on-warning
ac_cv_func_pthread_attr_getstack=yes
"

termux_step_host_build() {
	mkdir HOSTBUILDINSTALL

	../src/configure \
		--prefix=$TERMUX_PKG_HOSTBUILD_DIR/HOSTBUILDINSTALL \
		--program-suffix=1.8 \
		--disable-error-on-warning

	make -j $TERMUX_MAKE_PROCESSES
	make install
}

termux_step_pre_configure() {
	CFLAGS=${CFLAGS/Oz/Os}

	if [ $TERMUX_ARCH = "i686" ]; then
		TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --without-threads"
	fi

	export GUILE_FOR_BUILD=$TERMUX_PKG_HOSTBUILD_DIR/HOSTBUILDINSTALL/bin/guile1.8
	export LD_LIBRARY_PATH=$TERMUX_PKG_HOSTBUILD_DIR/HOSTBUILDINSTALL/lib
}
