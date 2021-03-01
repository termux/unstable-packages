TERMUX_PKG_HOMEPAGE=https://github.com/VirusTotal/yara
TERMUX_PKG_DESCRIPTION="Tool aimed at helping malware researchers to identify and classify malware samples"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Pliushch <leonid.pliushch@gmail.com>"
TERMUX_PKG_VERSION=4.0.5
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/VirusTotal/yara/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ea7ebefad05831faf6f780cab721611b0135803f03a84c27eeba7bfe0afc3aae
TERMUX_PKG_DEPENDS="file, openssl"
TERMUX_PKG_BREAKS="yara-dev"
TERMUX_PKG_REPLACES="yara-dev"

termux_step_pre_configure() {
	./bootstrap.sh
}
