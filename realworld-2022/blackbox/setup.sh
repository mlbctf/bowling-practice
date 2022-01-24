#!/bin/sh

echo "[*] Building initrd"
mkdir files
cd files
cp ../init .
mkdir bin
cd bin
wget https://busybox.net/downloads/binaries/1.21.1/busybox-x86_64
mv busybox-x86_64 busybox
chmod 755 busybox
./busybox --install .
chmod -R 755 .
cd ../..


echo "[*] Building vulnerable QEMU"
git clone https://github.com/qemu/qemu.git
git checkout f243bb4b0d6dab7da3ae8490e0f46054bae93816
cd qemu
mkdir build
cd build
../configure --target-list="x86_64-softmmu" --disable-werror
make -j$(nproc)

