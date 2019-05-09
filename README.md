# Repository for new/unstable packages

[![Powered by JFrog Bintray](./.github/static/powered-by-bintray.png)](https://bintray.com)

There are located packages which were requested, but not added to the
[main][termux-packages] Termux repository due to various reasons. Packages
available here may have lower quality, be unstable or not work at all.

## How to enable this repository

To enable this package repository run:

```ShellSession
pkg install unstable-repo
```

## Building packages manually

You can build all packages manually by using provided docker image. The
only requirements are Linux-based host with Docker installed.

1. Clone this repository:
	```ShellSession
	git clone https://github.com/termux/unstable-packages
	```

2. Enter build environment (will download docker image if necessary):
	```ShellSession
	cd ./unstable-packages
	./start-builder.sh
	```

3. Choose package you want to build and run:
	```ShellSession
	./build-package.sh -a ${arch} ${package name}
	```
	Make sure that you replaced `${arch}` with target CPU architecture and
	`${package name}` with package name you want to build.

## Contributing

If you wish to contribute, please take a look on our [contributing guide](./CONTRIBUTING.md).

[termux-packages]: <https://github.com/termux/termux-packages>
