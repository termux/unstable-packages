#!@TERMUX_PREFIX@/bin/bash
set -e
export PREFIX=@TERMUX_PREFIX@

# Lock terminal to prevent sending text input and special key
# combinations that may break installation process.
stty -echo -icanon time 0 min 0 intr undef quit undef susp undef

# Use trap to unlock terminal at exit.
trap 'while read -r; do true; done; stty sane;' EXIT

# Install 'msgpack' if necessary.
echo -n "[*] Checking if 'msgpack' is installed: "
if pip2 show msgpack > /dev/null 2>&1; then
	echo "yes"
else
	echo "no"
	echo "[*] Installing 'msgpack' for Python 2..."
	pip2 install msgpack
fi

# Install 'gevent' if necessary.
echo -n "[*] Checking if 'gevent' is installed: "
if pip2 show gevent > /dev/null 2>&1; then
	echo "yes"
else
	echo "no"
	echo "[*] Installing 'gevent' for Python 2 (may take long time)..."
	pip2 install gevent
fi

exit 0
