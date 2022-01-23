# Black Box Qemu Escape Challenge

This challenge is based on CVE-2020-14364

## Setup

```
git clone https://github.com/qemu/qemu.git

git checkout f243bb4b0d6dab7da3ae8490e0f46054bae93816

mkdir build && cd build
../configure --target-list="x86_64-softmmu" --disable-werror
make -j$(nproc)

# Create a qemu image or initramfs to boot the drive like in ./run.sh
```
