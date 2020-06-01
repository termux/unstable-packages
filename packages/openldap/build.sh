##
##  COMPLETELY UNTESTED.
##

TERMUX_PKG_HOMEPAGE=https://openldap.org
TERMUX_PKG_DESCRIPTION="OpenLDAP server"
TERMUX_PKG_LICENSE="OpenLDAP"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=2.4.49
TERMUX_PKG_SRCURL=ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-$TERMUX_PKG_VERSION.tgz
TERMUX_PKG_SHA256=e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e
TERMUX_PKG_DEPENDS="libsasl, libuuid, openssl"
TERMUX_PKG_BREAKS="openldap-dev"
TERMUX_PKG_REPLACES="openldap-dev"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
ol_cv_lib_icu=no
ac_cv_func_memcmp_working=yes
--enable-dynamic
--with-yielding_select=yes
--enable-backends=no
--enable-monitor
--enable-mdb
--enable-ldap"

termux_step_pre_configure() {
	CFLAGS+=" -DMDB_USE_ROBUST=0"
	LDFLAGS+=" -lcrypto -llog"
}

termux_step_make_install() {
	make STRIP="" install
}
