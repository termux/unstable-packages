#!@TERMUX_PREFIX@/bin/bash

set -e

PREFIX=@TERMUX_PREFIX@
TL_ROOT=$PREFIX/share/texlive

cd $TL_ROOT
for patch in $PREFIX/opt/texlive/*.diff; do
    printf "Checking if \$PREFIX/opt/texlive/$(basename $patch) can be applied.. "
    if ! patch -R -p0 -s -f --dry-run < $patch &> /dev/null; then
        patch -p0 < $patch
    else
        echo "Nope"
    fi
done
