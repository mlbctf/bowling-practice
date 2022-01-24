#!/bin/sh
musl-gcc --static -o exploit exploit.c &&
mv exploit files/ &&
cd files &&
find . | cpio -H newc -ov -F ../initramfs.cpio && cd .. &&
./qemu/build/x86_64-softmmu/qemu-system-x86_64 \
    -m 2G \
    -kernel ./bzImage \
    -initrd ./initramfs.cpio \
    --append "console=ttyS0 nokaslr quiet" \
    -nographic \
    -monitor /dev/null \
    -drive if=none,id=usbstick,format=raw,file=./usb.img \
    -usb \
    -device usb-ehci,id=ehci \
    -device usb-tablet,bus=usb-bus.0 \
    -device usb-storage,bus=ehci.0,drive=usbstick

