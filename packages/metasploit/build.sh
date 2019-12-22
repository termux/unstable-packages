TERMUX_PKG_HOMEPAGE=https://www.metasploit.com/
TERMUX_PKG_DESCRIPTION="Advanced open-source platform for developing, testing and using exploit code. (installer)"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=5.0.65
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

# Many dependencies specified here are required to build & install
# ruby gems used by Metasploit.
TERMUX_PKG_DEPENDS="apr, apr-util, autoconf, bison, clang, coreutils, curl, findutils, git, libffi, libgmp, libiconv, libpcap, libsqlite, libtool, libxml2, libxslt, make, ncurses, ncurses, ncurses-utils, openssl, pkg-config, postgresql, readline, resolv-conf, ruby, tar, termux-elf-cleaner, termux-tools, unzip, wget, zip, zlib"

termux_step_make_install() {
	# Installer.
	sed -e "s|@TERMUX_PREFIX@|${TERMUX_PREFIX}|g" \
		-e "s|@MSF_VERSION@|$TERMUX_PKG_VERSION|g" \
		"$TERMUX_PKG_BUILDER_DIR"/installer.sh \
		> "$TERMUX_PREFIX"/bin/metasploit-installer.sh
	chmod 700 "$TERMUX_PREFIX"/bin/metasploit-installer.sh

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
		echo "bash $TERMUX_PREFIX/bin/metasploit-installer.sh"
	} > ./postinst
	chmod 755 ./postinst

	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "[ \$1 != remove ] && exit 0"
		echo "rm -rf $TERMUX_PREFIX/opt/metasploit-framework"
	} > ./postrm
	chmod 755 ./postrm
}
