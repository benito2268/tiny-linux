#!/bin/bash

SRC_DIR="./src"
OUT_DIR="./out"
LINUX_DIR="./linux"
LINUX_SRC_URL="https://github.com/torvalds/linux.git"

# clone linux
if [[ ! -f "$LINUX_DIR" ]]; then
    git clone --depth 1 --branch 'v6.7' "$LINUX_SRC_URL" 
fi

# clean
source ./clean.sh

# configure and build the kernel
make -C "$LINUX_DIR" allnoconfig
cp ./tinylinux_defconfig "$LINUX_DIR"/arch/x86/configs
make -C "$LINUX_DIR" tinylinux_defconfig

make -C "$LINUX_DIR" -j $(nproc)

# build the initramfs
make -C "$SRC_DIR"

# copy the outputs to the out/ dir
mkdir "$OUT_DIR"
cp "$LINUX_DIR"/arch/x86_64/boot/bzImage "$OUT_DIR"
cp "$SRC_DIR"/init.cpio "$OUT_DIR"
echo "COMPILATION FINISHED: FILES IN ./out"
