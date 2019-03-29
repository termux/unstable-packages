TERMUX_PKG_HOMEPAGE=https://www.metasploit.com/
TERMUX_PKG_DESCRIPTION="Advanced open-source platform for developing, testing, and using exploit code"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=5.0.13
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/rapid7/metasploit-framework/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=dd035f14b6c691174796f83bc3986c44ba62685de19d6d0d877047846862c11c
TERMUX_PKG_PLATFORM_INDEPENDENT=true

# Many dependencies specified here are required to build & install
# ruby gems used by Metasploit.
TERMUX_PKG_DEPENDS="apr, apr-util, autoconf, bison, clang, coreutils, curl, findutils, git, libffi-dev, libgmp-dev, libpcap-dev, libsqlite-dev, libtool, libxml2-dev, libxslt-dev, make, ncurses, ncurses-dev, ncurses-utils, openssl-dev, pkg-config, postgresql, postgresql-dev, readline-dev, resolv-conf, ruby-dev, tar, termux-elf-cleaner, termux-tools, unzip, wget, zip"

termux_step_make_install() {
	# Metasploit sources.
	mkdir -p "$TERMUX_PREFIX"/opt
	rm -rf "$TERMUX_PREFIX"/opt/metasploit-framework
	cp -a "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/metasploit-framework

	# Installer.
	install -Dm700 "$TERMUX_PKG_BUILDER_DIR"/installer.sh \
		"$TERMUX_PREFIX"/opt/metasploit-framework/installer.sh
	sed -i "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" \
		"$TERMUX_PREFIX"/opt/metasploit-framework/installer.sh

	# Database configuration file.
	install -Dm600 "$TERMUX_PKG_BUILDER_DIR"/database.yml \
		"$TERMUX_PREFIX"/opt/metasploit-framework/config/database.yml

	# Wrapper.
	install -Dm700 "$TERMUX_PKG_BUILDER_DIR"/msfconsole.sh \
		"$TERMUX_PREFIX"/bin/msfconsole
	sed -i "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" \
		"$TERMUX_PREFIX"/bin/msfconsole
	for i in msfd msfrpc msfrpcd msfvenom; do
		ln -sfr "$TERMUX_PREFIX"/bin/msfconsole "$TERMUX_PREFIX"/bin/$i
	done
}

termux_step_create_debscripts() {
	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "bash $TERMUX_PREFIX/opt/metasploit-framework/installer.sh"
	} > ./postinst
	chmod 755 ./postinst

	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "[ \$1 != remove ] && exit 0"
		echo "rm -rf $TERMUX_PREFIX/opt/metasploit-framework"
	} > ./postrm
	chmod 755 ./postrm
}
