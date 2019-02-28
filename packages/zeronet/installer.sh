#!@TERMUX_PREFIX@/bin/bash
set -e
export PREFIX=@TERMUX_PREFIX@

MSGPACK_INSTALLED=false
GEVENT_INSTALLED=false

# Function for locking terminal.
lock_terminal() {
	stty -echo -icanon time 0 min 0 intr undef quit undef susp undef
}

# Function to unlock terminal.
unlock_terminal() {
	while read -r; do
		true;
	done
	stty sane
}

trap 'while read -r; do true; done; stty sane;' EXIT
lock_terminal

# Check if ZeroNet dependencies are installed.
echo -n "[*] Checking if 'msgpack' is installed: "
if pip2 show msgpack > /dev/null 2>&1; then
	echo "yes"
	MSGPACK_INSTALLED=true
else
	echo "no"
fi
echo -n "[*] Checking if 'gevent' is installed: "
if pip2 show gevent > /dev/null 2>&1; then
	echo "yes"
	GEVENT_INSTALLED=true
else
	echo "no"
fi

# Installing 'msgpack' if needed.
if ! $MSGPACK_INSTALLED; then
	echo "[*] Installing 'msgpack' for Python 2..."
	pip2 install msgpack
fi

# Installing 'gevent' if needed.
if ! $GEVENT_INSTALLED; then
	echo "[*] Installing 'gevent' for Python 2 (may take long time)..."
	pip2 install gevent
fi

exit 0
