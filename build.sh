#!/bin/bash

LINUX_DIR="./linux"
LINUX_SRC_URL="https://github.com/torvalds/linux.git"

# clone linux
if [[ ! -f "$LINUX_DIR" ]]; then
    git clone --depth 1 --branch 'v6.7' "$LINUX_SRC_URL" 
fi

# configure and build the kernel
make -C "$LINUX_DIR" clean


make -C "$LINUX_DIR" allnoconfig
cp ./tinylinux_defconfig "$LINUX_DIR"/arch/x86/configs
make -C "$LINUX_DIR" tinylinux_defconfig

make -C "$LINUX_DIR" -j $(nproc)
