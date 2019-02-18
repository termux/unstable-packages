#!/bin/sh
set -e -u

HOME=/home/builder
USER=builder
REPOROOT=$(dirname "$(realpath "$0")")
LOCKFILE="/tmp/.termux-extra-builder.lck"

IMAGE_NAME="xeffyr/termux-extra-packages-builder"
: ${CONTAINER_NAME:=termux-unstable-packages-builder}

cd "$REPOROOT"

if [ ! -e "$LOCKFILE" ]; then
	touch "$LOCKFILE"
fi

if [ ! -e "$REPOROOT/termux-packages/build-package.sh" ]; then
	echo "[*] Setting up repository submodules..."
	git submodule update --init --recursive
else
	(flock -n 3 || exit 0
		echo "[*] Copying packages to the build environment..."
		cd "$REPOROOT"/termux-packages && git clean -fdxq && git checkout -- .
		cp -a "$REPOROOT"/packages/* "$REPOROOT"/termux-packages/packages/
	) 3< "$LOCKFILE"
fi

(flock -n 3 || true
	echo "[*] Running container '$CONTAINER_NAME' from image '$IMAGE_NAME'..."
	if ! docker start "$CONTAINER_NAME" > /dev/null 2>&1; then
		echo "Creating new container..."
		docker run \
			--detach \
			--env HOME="$HOME" \
			--name "$CONTAINER_NAME" \
			--volume "$REPOROOT/termux-packages:$HOME/packages" \
			--tty \
			"$IMAGE_NAME"

		if [ "$(id -u)" -ne 0 ] && [ "$(id -u)" -ne 1000 ]; then
			echo "Changed builder uid/gid... (this may take a while)"
			docker exec --tty "$CONTAINER_NAME" chown -R $(id -u) "$HOME"
			docker exec --tty "$CONTAINER_NAME" chown -R $(id -u) /data
			docker exec --tty "$CONTAINER_NAME" usermod -u $(id -u) builder
			docker exec --tty "$CONTAINER_NAME" groupmod -g $(id -g) builder
		fi
	fi

	if [ $# -ge 1 ]; then
		docker exec --interactive --tty --user "$USER" "$CONTAINER_NAME" "$@"
	else
		docker exec --interactive --tty --user "$USER" "$CONTAINER_NAME" bash
	fi
) 3< "$LOCKFILE"
