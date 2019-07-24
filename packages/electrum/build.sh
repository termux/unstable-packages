TERMUX_PKG_HOMEPAGE=https://electrum.org
TERMUX_PKG_DESCRIPTION="Electrum is a lightweight Bitcoin wallet."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=3.3.8
TERMUX_PKG_SRCURL=https://download.electrum.org/$TERMUX_PKG_VERSION/Electrum-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e2adf191847609d5bd850320f647db6347952b170364a463276db27a836400bc
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_PLATFORM_INDEPENDENT=yes
# asciinema previously contained some files that python packages have in common
TERMUX_PKG_CONFLICTS="asciinema (<< 1.4.0-1)"

_PYTHON_VERSION=3.7

TERMUX_PKG_RM_AFTER_INSTALL="
bin/easy_install
bin/qr
bin/chardetect
bin/easy_install-${_PYTHON_VERSION}
lib/python${_PYTHON_VERSION}/site-packages/easy-install.pth
lib/python${_PYTHON_VERSION}/site-packages/site.py
lib/python${_PYTHON_VERSION}/site-packages/setuptools.pth
lib/python${_PYTHON_VERSION}/site-packages/electrum/gui/qt
lib/python${_PYTHON_VERSION}/site-packages/attrs-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/PySocks-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/dnspython-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/ecdsa-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/jsonrpclib_pelix-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/pbkdf2-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/protobuf-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/pyaes-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/qrcode-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/aiohttp_socks-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/aiorpcX-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/async_timeout-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/certifi-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/yarl-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/QDarkStyle-*-py${_PYTHON_VERSION}.egg
lib/python${_PYTHON_VERSION}/site-packages/aiohttp-*-py${_PYTHON_VERSION}-*.egg
lib/python${_PYTHON_VERSION}/site-packages/multidict-*-py${_PYTHON_VERSION}-*.egg
lib/python${_PYTHON_VERSION}/site-packages/protobuf-*-py${_PYTHON_VERSION}-*.egg
"

termux_step_make () {
	return
}

termux_step_make_install () {
	# Force reinstall:
	rm -rf $TERMUX_PREFIX/lib/python${_PYTHON_VERSION}/site-packages/electrum
	rm -rf $TERMUX_PREFIX/lib/python${_PYTHON_VERSION}/site-packages/Electrum-${TERMUX_PKG_VERSION}-py${_PYTHON_VERSION}.egg*
	export PYTHONPATH=$TERMUX_PREFIX/lib/python${_PYTHON_VERSION}/site-packages/
	python${_PYTHON_VERSION} setup.py install --prefix=$TERMUX_PREFIX
}

termux_step_post_massage () {
	find . -path '*/__pycache__*' -delete
	# Other python packages also provides this file. Should be removed from all python packages
	for file in ./lib/python${_PYTHON_VERSION}/site-packages/easy-install.pth ./lib/python${_PYTHON_VERSION}/site-packages/site.py; do
		if [ -f $file ]; then
			rm $file
		fi
	done
}

termux_step_create_debscripts () {
	echo "#!$TERMUX_PREFIX/bin/sh" > postinst
	echo "pip3 install aiohttp_socks aiorpcx requests qrcode pyaes protobuf pbkdf2 jsonrpclib-pelix ecdsa dnspython PySocks qdarkstyle==2.5.4 typing" >> postinst
}
