TERMUX_PKG_HOMEPAGE=https://dev.maxmind.com/geoip/geoip2/geolite2/
TERMUX_PKG_DESCRIPTION="GeoLite2 IP geolocation databases compiled by MaxMind"
TERMUX_PKG_LICENSE="CC0-1.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

## Version is DB modification date. Use script 'check-last-modified.sh'
## to view last modification date.
TERMUX_PKG_VERSION=20190212
TERMUX_PKG_REVISION=1

TERMUX_PKG_SRCURL=('https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
				   'https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz'
				   'https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz')

## If these checksums becomes invalid - it's time to update package.
TERMUX_PKG_SHA256=('faa4d95dacd1236b986abc8d4b7d7aef42c3b4f789d61f93bbbc7605cc656d4b'
				   '654ac2722dba635161fd789ff96c2685bba20c4fda06902d1687b0606388646e'
				   '8d888f8f8390f68b5360f0d47440f0b4f62a08228041bc8a7e916a51292f2d03')

termux_step_make_install() {
	install -Dm600 \
		-t "$TERMUX_PREFIX"/share/GeoIP/ \
		$(find "$TERMUX_PKG_SRCDIR" -type f -iname \*.mmdb)
}
