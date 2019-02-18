#!/bin/bash -e

URLS=('https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
      'https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz'
      'https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz')

for url in ${URLS[@]}; do
	last_mod=$(curl -sI "$url" | grep -i ^Last-Modified: | cut -d' ' -f2- | tr -d '\r')
	echo "$last_mod (${url##*/})"
done

