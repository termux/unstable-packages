#!@TERMUX_PREFIX@/bin/bash
set -e
export PREFIX=@TERMUX_PREFIX@
export TMPDIR=@TERMUX_PREFIX@/tmp
export MSF_VERSION=@MSF_VERSION@

# Lock terminal to prevent sending text input and special key
# combinations that may break installation process.
stty -echo -icanon time 0 min 0 intr undef quit undef susp undef

# Use trap to unlock terminal at exit.
trap 'while read -r; do true; done; stty sane;' EXIT

if [ "$(id -u)" = "0" ]; then
	echo "[!] Sorry but I won't let you to install this package as root."
	exit 1
fi

FOLD_COLUMNS=45
if [[ $COLUMNS =~ ([[:digit:]]) ]] && ((COLUMNS < FOLD_COLUMNS)); then
	FOLD_COLUMNS=$COLUMNS
fi

echo
echo "======= TERMUX METASPLOIT DISCLAIMER ======="
{
	echo
	echo "Metasploit Framework and its dependencies are being sideloaded.  That solution makes package potentially unstable.  We do not guarantee compatibility of installed Ruby modules with our Ruby interpreter version and general compatibility with Android OS."
	echo
	echo "It is highly recommended to have a stable Internet connection and clean Termux environment with up-to-date packages before installing Metasploit."
	echo
	echo "Package is intended to be used by experienced users.  Do not ask Termux developers about how to use Metasploit, we won't do so and generally are not helping anyone with topics related to hacking."
	echo
	echo "Installation will be started in 10 seconds, thanks for attention."
	echo
} | fold -s -w "$FOLD_COLUMNS"
echo "============================================"
echo

sleep 10

echo "[*] Downloading Metasploit Framework..."
mkdir -p "$TMPDIR"
rm -f "$TMPDIR/metasploit-$MSF_VERSION.tar.gz"
curl --fail --retry 5 --retry-connrefused --retry-delay 5 --location \
	--output "$TMPDIR/metasploit-$MSF_VERSION.tar.gz" \
	"https://github.com/rapid7/metasploit-framework/archive/$MSF_VERSION.tar.gz"

echo "[*] Removing previous version Metasploit Framework..."
rm -rf "$PREFIX"/opt/metasploit-framework

echo "[*] Extracting new version of Metasploit Framework..."
mkdir -p "$PREFIX"/opt/metasploit-framework
tar zxf "$TMPDIR/metasploit-$MSF_VERSION.tar.gz" --strip-components=1 \
	-C "$PREFIX"/opt/metasploit-framework

echo "[*] Installing 'rubygems-update' if necessary..."
if [ "$(gem list -i rubygems-update 2>/dev/null)" = "false" ]; then
	gem install --no-document --verbose rubygems-update
fi

echo "[*] Updating Ruby gems..."
update_rubygems

echo "[*] Installing 'bundler'..."
gem install --no-document --verbose bundler

echo "[*] Installing Metasploit dependencies (may take long time)..."
cd "$PREFIX"/opt/metasploit-framework
bundle config build.nokogiri --use-system-libraries
bundle install --jobs=2 --verbose

echo "[*] Running fixes..."
sed -i "s@/etc/resolv.conf@$PREFIX/etc/resolv.conf@g" "$PREFIX"/opt/metasploit-framework/lib/net/dns/resolver.rb
find "$PREFIX"/opt/metasploit-framework -type f -executable -print0 | xargs -0 -r termux-fix-shebang
find "$PREFIX"/lib/ruby/gems -type f -iname \*.so -print0 | xargs -0 -r termux-elf-cleaner

echo "[*] Setting up PostgreSQL database..."
mkdir -p "$PREFIX"/opt/metasploit-framework/config
cat <<- EOF > "$PREFIX"/opt/metasploit-framework/config/database.yml
production:
  adapter: postgresql
  database: msf_database
  username: msf
  password:
  host: 127.0.0.1
  port: 5432
  pool: 75
  timeout: 5
EOF
mkdir -p "$PREFIX"/var/lib/postgresql
pg_ctl -D "$PREFIX"/var/lib/postgresql stop > /dev/null 2>&1 || true
if ! pg_ctl -D "$PREFIX"/var/lib/postgresql start --silent; then
    initdb "$PREFIX"/var/lib/postgresql
    pg_ctl -D "$PREFIX"/var/lib/postgresql start --silent
fi
if [ -z "$(psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='msf'")" ]; then
    createuser msf
fi
if [ -z "$(psql -l | grep msf_database)" ]; then
    createdb msf_database
fi

echo "[*] Metasploit Framework installation finished."

exit 0
