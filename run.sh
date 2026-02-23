#!/bin/bash

qemu-system-x86_64 \
    -kernel ./out/bzImage \
    -initrd ./out/init.cpio \
    -append 'console=ttyS0 initrd=/init' \
    -nographic
