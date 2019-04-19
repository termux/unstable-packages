#!@TERMUX_PREFIX@/bin/bash
set -e
export PREFIX=@TERMUX_PREFIX@

# Lock terminal to prevent sending text input and special key
# combinations that may break installation process.
stty -echo -icanon time 0 min 0 intr undef quit undef susp undef

# Use trap to unlock terminal at exit.
trap 'while read -r; do true; done; stty sane;' EXIT

echo "[*] Installing 'rubygems-update' if necessary..."
if [ "$(gem list -i rubygems-update 2>/dev/null)" = "false" ]; then
	gem install --no-document --verbose rubygems-update
fi

echo "[*] Updating Ruby gems..."
update_rubygems

echo "[*] Installing 'bundler' if necessary..."
if [ "$(gem list -i bundler 2>/dev/null)" = "false" ]; then
	gem install --no-document --verbose bundler
fi

echo "[*] Installing Metasploit dependencies (may take long time)..."
cd "$PREFIX"/opt/metasploit-framework
bundle install --jobs=2 --verbose

echo "[*] Running fixes..."
"$PREFIX"/bin/find "$PREFIX"/opt/metasploit-framework -type f -executable -print0 | xargs -0 -r termux-fix-shebang
"$PREFIX"/bin/find "$PREFIX"/lib/ruby/gems -type f -iname \*.so -print0 | xargs -0 -r termux-elf-cleaner

echo "[*] Setting up PostgreSQL database..."
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
