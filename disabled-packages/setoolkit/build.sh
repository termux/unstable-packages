##
##  Setoolkit is the one of packages having the worst portability ever.
##
##  Do not expect that it will cover your needs at more than 10%. This
##  will remain until something changes at upstream.
##

TERMUX_PKG_HOMEPAGE=https://github.com/trustedsec/social-engineer-toolkit
TERMUX_PKG_DESCRIPTION="The Social-Engineer Toolkit"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=7.7.9
TERMUX_PKG_REVISION=5
TERMUX_PKG_SRCURL=https://github.com/trustedsec/social-engineer-toolkit/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=267b2efa0470f0da9f6d53414f9a433aaea176d1a6825581ade8998924ddffd0
TERMUX_PKG_DEPENDS="clang, coreutils, libffi, libjpeg-turbo, metasploit, openssl, python, zlib"
TERMUX_PKG_RECOMMENDS="libffi-dev, libjpeg-turbo-dev, openssl-dev, python-dev, zlib-dev"
TERMUX_PKG_PLATFORM_INDEPENDENT=true

#
# External packages required by setoolkit:
#
# - aircrack-ng: available in root-repo. Requires monitor mode support in firmware
#                which is most likely (up to 99.95%) unsupported on your device.
#
# - apache2: available via `pkg install apache2` or as dependency. Unfortunately SET
#            relies on sysvinit/openrc scripts to start or stop daemon and we can't
#            do anything with that.
#
# - dsniff: provides utility 'dnsspoof'. Not available for Termux.
#
# - ettercap: not available for Termux.
#
# - isc-dhcp-server: not available for Termux.
#
# - nginx: available via `pkg install nginx` or as dependency. Unfortunately SET
#          relies on sysvinit/openrc scripts to start or stop daemon and we can't
#          do anything with that.
#
# - sendmail: available for Termux only as busybox applet which is quite limited.
#             It also worth to mention that running SMTP server on mobile device
#             is impossible (with rare exceptions) because ISPs usually block
#             25th port as well as others.
#
# - tsu: available in root-repo. It is a recommended way to launch shell with
#        root privileges.
#
# - upx: not available for Termux.
#
TERMUX_PKG_RECOMMENDS="aircrack-ng, apache2, dsniff, ettercap, isc-dhcp-server, nginx, sendmail, tsu, upx"

termux_step_make_install() {
	# Remove unneeded files.
	rm -rf "$TERMUX_PKG_SRCDIR"/{.github,.gitignore,README.md,setup.py}

	# Updates are not supported from third-party side.
	rm -f "$TERMUX_PKG_SRCDIR"/seupdate

	# Install patched setoolkit sources.
	mkdir -p "$TERMUX_PREFIX"/opt
	rm -rf "$TERMUX_PREFIX"/opt/setoolkit
	cp -a "$TERMUX_PKG_SRCDIR" "$TERMUX_PREFIX"/opt/setoolkit

	# Copy the python modules installation script.
	install -Dm700 "$TERMUX_PKG_BUILDER_DIR"/install-deps.sh \
		"$TERMUX_PREFIX"/opt/setoolkit/install-deps.sh

	# Install wrappers.
	for wrapper in seautomate seproxy setoolkit; do
		sed "s|@TERMUX_PREFIX@|${TERMUX_PREFIX}|" \
			"$TERMUX_PKG_BUILDER_DIR/${wrapper}.in" > "$TERMUX_PREFIX/bin/$wrapper"
		chmod 700 "$TERMUX_PREFIX/bin/$wrapper"
	done
	unset wrapper
}

termux_step_create_debscripts() {
	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "bash $TERMUX_PREFIX/opt/setoolkit/install-deps.sh"
	} > ./postinst
	chmod 755 ./postinst

	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "[ \$1 != remove ] && exit 0"
		echo "rm -rf $TERMUX_PREFIX/opt/setoolkit"
	} > ./postrm
	chmod 755 ./postrm
}
