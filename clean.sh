#!/bin/bash
SRC_DIR="./src"
LINUX_DIR="./linux"

make -C "$LINUX_DIR" clean
make -C "$SRC_DIR" clean
