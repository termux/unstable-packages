TERMUX_PKG_HOMEPAGE=http://biblatex-biber.sourceforge.net
TERMUX_PKG_DESCRIPTION="A Unicode-capable BibTeX replacement for biblatex users"
TERMUX_PKG_LICENSE="Artistic-License-2.0"
TERMUX_PKG_MAINTAINER="Henrik Grimler @Grimler91"
TERMUX_PKG_VERSION=2.15
TERMUX_PKG_REVISION=1
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_DEPENDS="perl, libxslt, libxml2 (>> 2.9.10-3), openssl-tool, make, clang, pkg-config"

EXTUTILS_LIBBUILDER_VERSION=0.08
TEXT_BIBTEX_VERSION=0.88

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/opt/biber
	sed -e "s|@TERMUX_PREFIX@|${TERMUX_PREFIX}|g" \
		-e "s|@TEXT_BIBTEX_VERSION@|${TEXT_BIBTEX_VERSION}|g" \
		-e "s|@EXTUTILS_LIBBUILDER_VERSION@|${EXTUTILS_LIBBUILDER_VERSION}|g" \
		-e "s|@BIBER_VERSION@|${TERMUX_PKG_VERSION}|g" \
		"$TERMUX_PKG_BUILDER_DIR"/installer.sh \
		> $TERMUX_PREFIX/opt/biber/termux-biber-install.sh
	chmod 700 $TERMUX_PREFIX/opt/biber/termux-biber-install.sh
	install -m600 "$TERMUX_PKG_BUILDER_DIR"/ExtUtils-LibBuilder.diff $TERMUX_PREFIX/opt/biber/
	install -m600 "$TERMUX_PKG_BUILDER_DIR"/Text-BibTeX.diff $TERMUX_PREFIX/opt/biber/
	# Uninstalling all dependencies on uninstall would be annoying, so
	# lets leave that for the user to deal with..
}

termux_step_create_debscripts() {
	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "echo \"[*] Running $TERMUX_PREFIX/opt/biber/termux-biber-install.sh...\""
		echo "$TERMUX_PREFIX/opt/biber/termux-biber-install.sh"
	} > ./postinst
}
