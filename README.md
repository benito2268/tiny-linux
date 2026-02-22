## Tiny Linux
This has been done many times before, cowabunga here we go again.
The kernel and initramfs combined are about 770KB - and lack almost everything :)

## Build and Run
* Install everything you normally would need to build a kernel
* The scripts do everything just run `./build.sh` to build the kernel and initramfs.
* To run install `qemu-system-x86-64` and...
  ```
  qemu-system-x86_64 \
    -kernel ./out/bzImage \
    -initrd ./out/init.cpio \
    -append 'console=ttyS0 initrd=/init' \
    -nographic
  ```
