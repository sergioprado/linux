#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-
export PATH=/home/sprado/projects/boards/beagleplay/toolchain/gcc/bin/:$PATH

make beagleplay_defconfig
make -j$(nproc)
cp -v arch/$ARCH/boot/Image.gz /srv/tftp/
make ti/k3-am625-beagleplay.dtb
cp -v arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb /srv/tftp/
