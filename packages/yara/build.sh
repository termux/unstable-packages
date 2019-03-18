TERMUX_PKG_HOMEPAGE=https://github.com/VirusTotal/yara
TERMUX_PKG_DESCRIPTION="Tool aimed at helping malware researchers to identify and classify malware samples"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=3.9.0
TERMUX_PKG_SRCURL=https://github.com/VirusTotal/yara/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ebe7fab0abadb90449a62afbd24e196e18b177efe71ffd8bf22df95c5386f64d
TERMUX_PKG_DEPENDS="file, openssl"

termux_step_pre_configure() {
	./bootstrap.sh
}
