# Repository for new/unstable packages

[![Packages last build status](https://github.com/termux/unstable-packages/workflows/Packages/badge.svg)](https://github.com/termux/unstable-packages/actions)

[![Powered by JFrog Bintray](./.github/static/powered-by-bintray.png)](https://bintray.com)

There are located packages which were requested, but not added to the
[main][termux-packages] Termux repository due to various reasons. Packages
available here may have lower quality, be unstable or not work at all.

## How to enable this repository

To enable this package repository run:

```
pkg install unstable-repo
```

## Building packages manually

You can build all packages manually by using provided docker image. The only
requirements are Linux-based host with Docker installed.

1. Clone this repository:
	```
	git clone https://github.com/termux/unstable-packages
	```

2. Enter build environment (will download docker image if necessary):
	```
	cd ./unstable-packages
	./start-builder.sh
	```

3. Choose package you want to build and run:
	```
	./build-package.sh -a ${arch} ${package name}
	```
	Replace `${arch}` with target CPU architecture and `${package name}` with
	package name you want to build.

## Contributing

[I](https://github.com/xeffyr) am working on packages in my spare time and probably
will not be able to process your issues instantly. It would be very helpful if you
submit a pull request with new packages or bug fixes.

If you wish to contribute, please take a look at Unstable packages [contributing guide](./CONTRIBUTING.md)
and developer's [wiki pages](https://github.com/termux/termux-packages/wiki).

[termux-packages]: <https://github.com/termux/termux-packages>
