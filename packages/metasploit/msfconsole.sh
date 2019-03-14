#!@TERMUX_PREFIX@/bin/sh

SCRIPT_NAME=$(basename "$0")
METASPLOIT_PATH="@TERMUX_PREFIX@/opt/metasploit-framework"

# Fix ruby bigdecimal extensions linking error.
case "$(uname -m)" in
	aarch64)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.6.0/aarch64-linux-android/bigdecimal.so"
		;;
	arm*)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.6.0/arm-linux-androideabi/bigdecimal.so"
		;;
	i686)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.6.0/i686-linux-android/bigdecimal.so"
		;;
	x86_64)
		export LD_PRELOAD="$LD_PRELOAD:@TERMUX_PREFIX@/lib/ruby/2.6.0/x86_64-linux-android/bigdecimal.so"
		;;
	*)
		;;
esac

case "$SCRIPT_NAME" in
	msfconsole|msfd|msfrpc|msfrpcd|msfvenom)
		exec ruby "$METASPLOIT_PATH/$SCRIPT_NAME" "$@"
		;;
	*)
		echo "[!] Unknown Metasploit command '$SCRIPT_NAME'."
		exit 1
		;;
esac
