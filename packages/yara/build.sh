TERMUX_PKG_HOMEPAGE=https://github.com/VirusTotal/yara
TERMUX_PKG_DESCRIPTION="Tool aimed at helping malware researchers to identify and classify malware samples"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=4.0.2
TERMUX_PKG_SRCURL=https://github.com/VirusTotal/yara/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=05ad88eac9a9f0232432fd14516bdaeda14349d6cf0cac802d76e369abcee001
TERMUX_PKG_DEPENDS="file, openssl"
TERMUX_PKG_BREAKS="yara-dev"
TERMUX_PKG_REPLACES="yara-dev"

termux_step_pre_configure() {
	./bootstrap.sh
}
