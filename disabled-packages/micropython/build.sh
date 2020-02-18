TERMUX_PKG_HOMEPAGE=http://micropython.org/
TERMUX_PKG_DESCRIPTION="Tiny implementation of Python programming language"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=1.9.4
TERMUX_PKG_SRCURL=https://github.com/micropython/micropython/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9a66205d0ba3dff6dcc98119f104cd59c15855c6c030a190ca02354be52836c1
TERMUX_PKG_DEPENDS="libffi, mbedtls"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
    ## Axtls lib.
    termux_download \
        "https://github.com/pfalcon/axtls/archive/v1.8.2.tar.gz" \
        "${TERMUX_PKG_CACHEDIR}/axtls.tar.gz" \
        541fd68e2b400f5167b325323dd23b4b48b458408ac9630a78adc22572f56298

    ## libffi.
    termux_download \
        "https://github.com/libffi/libffi/archive/v3.2.1.tar.gz" \
        "${TERMUX_PKG_CACHEDIR}/libffi.tar.gz" \
        96d08dee6f262beea1a18ac9a3801f64018dc4521895e9198d029d6850febe23

    ## Berkeley DB (embedded).
    termux_download \
        "https://github.com/pfalcon/berkeley-db-1.xx/archive/embedded.tar.gz" \
        "${TERMUX_PKG_CACHEDIR}/bdb.tar.gz" \
        7d39e293ef3f8c841c8b14368c70af9efb4416f7eb57760f261bf47cc0c8f059

    cd lib && {
        tar \
            xf "${TERMUX_PKG_CACHEDIR}/axtls.tar.gz" \
            --strip-components=1 \
            -C ./axtls

        tar \
            xf "${TERMUX_PKG_CACHEDIR}/libffi.tar.gz" \
            --strip-components=1 \
            -C ./libffi

        tar \
            xf "${TERMUX_PKG_CACHEDIR}/bdb.tar.gz" \
            --strip-components=1 \
            -C ./berkeley-db-1.xx
    }
}

termux_step_configure() {
    cd ports/unix && {
        sed -i 's/MICROPY_SSL_AXTLS = 1/MICROPY_SSL_AXTLS = 0/g' mpconfigport.mk
        sed -i 's/MICROPY_SSL_MBEDTLS = 0/MICROPY_SSL_MBEDTLS = 1/g' mpconfigport.mk
        sed -i 's/-Werror//g' Makefile
        sed -i 's/LDFLAGS_MOD += -lpthread//g' Makefile
        cd -
    }
}

termux_step_make() {
    unset CC CPP CXX CFLAGS CXXFLAGS LD

    export BUILD_VERBOSE=1

    cd mpy-cross && {
        make \
            -j "${TERMUX_MAKE_PROCESSES}"
        cd -
    }

    cd ports/unix && {
        make \
            CPP="${TERMUX_HOST_PLATFORM}-clang -E" \
            CC="${TERMUX_HOST_PLATFORM}-clang -pie" \
            CROSS_COMPILE="${TERMUX_HOST_PLATFORM}-"
        cd -
    }
}

termux_step_make_install() {
    cd ports/unix && {
        install \
            -Dm700 \
            micropython \
            "${TERMUX_PREFIX}/bin/micropython"
        cd -
    }
}
