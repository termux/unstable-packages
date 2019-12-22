#!@TERMUX_PREFIX@/bin/bash
set -e
export PREFIX=@TERMUX_PREFIX@

# Lock terminal to prevent sending text input and special key
# combinations that may break installation process.
stty -echo -icanon time 0 min 0 intr undef quit undef susp undef

# Use trap to unlock terminal at exit.
trap 'while read -r; do true; done; stty sane;' EXIT

# Installing python modules.
echo "[*] Installing python modules (may take long time)..."
for mod in pexpect pycrypto requests pyopenssl pefile impacket qrcode pillow; do
	if ! pip show "$mod" > /dev/null 2>&1; then
		pip install "$mod"
	fi
done
echo "[*] Finished."

exit 0
