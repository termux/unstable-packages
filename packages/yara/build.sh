TERMUX_PKG_HOMEPAGE=https://github.com/VirusTotal/yara
TERMUX_PKG_DESCRIPTION="Tool aimed at helping malware researchers to identify and classify malware samples"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=3.10.0
TERMUX_PKG_REVISION=4
TERMUX_PKG_SRCURL=https://github.com/VirusTotal/yara/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=3281d43d6b49a4ca8d3a5d2521e06a0b72863702022f981b051856c2b83449c2
TERMUX_PKG_DEPENDS="file, openssl"
TERMUX_PKG_BREAKS="yara-dev"
TERMUX_PKG_REPLACES="yara-dev"

termux_step_pre_configure() {
	./bootstrap.sh
}
