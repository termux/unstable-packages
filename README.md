# Repository for new/unstable packages

[![pipeline status](https://gitlab.com/xeffyr/unstable-packages/badges/master/pipeline.svg)](https://gitlab.com/xeffyr/unstable-packages/commits/master)

There are located packages which were requested, but not added to the
[main](https://github.com/termux/termux-packages) Termux repository due
to various reasons. Packages available here may have lower quality, be
unstable or not work at all.

## How to enable this repository

To enable this package repository run:

```
pkg install unstable-repo
```

## Building packages manually

You can build all packages manually by using provided docker image. The
only requirements are Linux-based host with Docker installed.

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
   ./build-package.sh -a {arch} {package name}
   ```
   \- replace `{arch}` with target CPU architecture and `{package name}`
   with package name you want to build.

## Contributing

If you wish to request package, submit a bug report or pull request for
this project, take a look on our [contributing guide](./CONTRIBUTING.md).

## External links

* Termux home page: https://termux.com/
* Termux Wiki: https://wiki.termux.com/wiki/Main_Page
* Termux App: https://github.com/termux/termux-app
* Termux Packages: https://github.com/termux/termux-packages
