##
## Build with:
##   docker build -t xeffyr/termux-advanced-builder .
##
## Push to docker hub with:
##   docker push xeffyr/termux-advanced-builder
##

FROM ubuntu:19.04

# Fix locale to avoid warnings:
ENV LANG en_US.UTF-8

ENV ANDROID_SDK_REVISION "4333796"
ENV ANDROID_SDK_BUILD_TOOLS_VERSION "28.0.3"
ENV ANDROID_NDK_VERSION "20"
ENV ANDROID_HOME "/opt/termux/android-sdk"
ENV NDK "/opt/termux/android-sdk/ndk-bundle"

# We may need x86 (32bit) packages.
RUN dpkg --add-architecture i386

# Make sure that everything is up-to-date.
RUN apt update && env DEBIAN_FRONTEND=noninteractive apt upgrade -yq

# Install essential packages.
RUN env DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    asciidoc \
    asciidoctor \
    autoconf \
    automake \
    bison \
    curl \
    docbook-to-man \
    docbook-utils \
    ed \
    elixir \
    erlang-nox \
    flex \
    gawk \
    gettext \
    git \
    g++ \
    g++-multilib \
    gnome-common \
    gnupg \
    gobject-introspection \
    gperf \
    groff \
    gtk-3-examples \
    gtk-doc-tools \
    help2man \
    intltool \
    jq \
    libexpat1-dev \
    libdbus-1-dev \
    libffi-dev \
    libgc-dev \
    libgdk-pixbuf2.0-dev \
    libgirepository1.0-dev \
    libglib2.0-dev \
    libgmp-dev \
    libgtk-3-bin \
    libisl-dev \
    libjpeg-dev \
    libltdl-dev \
    libmpc-dev \
    libmpfr-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libsigsegv-dev \
    libssl-dev \
    libtool-bin \
    libunistring-dev \
    libwayland-dev \
    llvm-8-tools \
    locales \
    lzip \
    m4 \
    openjdk-8-jdk-headless \
    pax-utils \
    pkg-config \
    python3.7 \
    python3-docutils \
    python3-pip \
    python3-recommonmark \
    python3-setuptools \
    python3-sphinx \
    python-pip \
    python-rdflib \
    python-setuptools \
    python-xcbgen \
    python-yaml \
    rsync \
    ruby \
    scons \
    texinfo \
    unzip \
    valac \
    xfonts-utils \
    xutils-dev \
    xmlto \
    zip \
    zlib1g-dev

# Install 32bit packages.
RUN env DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    libssl-dev:i386 \
    zlib1g-dev:i386

# Install developer tools.
RUN env DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    nano \
    silversearcher-ag \
    patchelf \
    patchutils

# Install OpenSSH.
# Used primarily on CI and similar.
RUN env DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    openssh-client \
    openssh-server

# Configure locales.
RUN locale-gen --purge en_US.UTF-8 && \
    echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

# Make environment variables available for bash.
RUN echo "export ANDROID_HOME=${ANDROID_HOME}\nexport NDK=${NDK}" > /etc/profile.d/termux-builder.sh && \
    chmod 644 /etc/profile.d/termux-builder.sh

# Install configuration files.
COPY ./configs/nanorc /etc/nanorc
COPY ./configs/ssh/ssh_known_hosts /etc/ssh/ssh_known_hosts
RUN chown root:root /etc/nanorc && chmod 644 /etc/nanorc && \
    chown root:root /etc/ssh/ssh_known_hosts && chmod 644 /etc/ssh/ssh_known_hosts

# Create user and add it to sudoers.
RUN env DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends sudo && \
    useradd -U -m -s /bin/bash builder && \
    echo "builder ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/builder

# Create necessary directories.
RUN mkdir /data && chown builder:builder /data && \
    mkdir -p /opt/termux

# Installing Android SDK and NDK.
RUN curl --fail --retry 3 -L -o sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_REVISION}.zip && \
    unzip -q sdk.zip -d ${ANDROID_HOME} && rm -f sdk.zip && \
    curl --fail --retry 3 -L -o ndk.zip https://dl.google.com/android/repository/android-ndk-r${ANDROID_NDK_VERSION}-Linux-x86_64.zip && \
    unzip -q ndk.zip && rm -f ndk.zip && mv android-ndk-r${ANDROID_NDK_VERSION} ${NDK}

# Installing Android SDK tools.
RUN mkdir -p /root/.android && echo 'count=0' > /root/.android/repositories.cfg
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platform-tools"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_SDK_BUILD_TOOLS_VERSION}"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-21"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-23"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-24"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-26"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-28"

# Cleanup.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set user.
USER builder:builder

# Set working directory.
WORKDIR /home/builder/packages
