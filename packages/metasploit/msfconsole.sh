#!@TERMUX_PREFIX@/bin/sh

SCRIPT_NAME=$(basename "$0")
METASPLOIT_PATH="@TERMUX_PREFIX@/opt/metasploit-framework"

# Fix ruby bigdecimal extensions linking error.
case "$(uname -m)" in
	aarch64)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.7.0/aarch64-linux-android/bigdecimal.so"
		;;
	arm*)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.7.0/arm-linux-androideabi/bigdecimal.so"
		;;
	i686)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.7.0/i686-linux-android/bigdecimal.so"
		;;
	x86_64)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.7.0/x86_64-linux-android/bigdecimal.so"
		;;
	*)
		;;
esac

case "$SCRIPT_NAME" in
	msfconsole)
		if [ ! -d "@TERMUX_PREFIX@/var/lib/postgresql" ]; then
			mkdir -p "@TERMUX_PREFIX@/var/lib/postgresql"
		fi
		pg_ctl -D "@TERMUX_PREFIX@/var/lib/postgresql" stop > /dev/null 2>&1 || true
		if ! pg_ctl -D "@TERMUX_PREFIX@/var/lib/postgresql" start --silent; then
			initdb "@TERMUX_PREFIX@/var/lib/postgresql"
			pg_ctl -D "@TERMUX_PREFIX@/var/lib/postgresql" start --silent
		fi
		if [ -z "$(psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='msf'")" ]; then
			createuser msf
		fi
		if [ -z "$(psql -l | grep msf_database)" ]; then
			createdb msf_database
		fi
		exec ruby "$METASPLOIT_PATH/$SCRIPT_NAME" "$@"
		;;
	msfd|msfrpc|msfrpcd|msfvenom)
		exec ruby "$METASPLOIT_PATH/$SCRIPT_NAME" "$@"
		;;
	*)
		echo "[!] Unknown Metasploit command '$SCRIPT_NAME'."
		exit 1
		;;
esac
