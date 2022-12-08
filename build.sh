#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-
export PATH=/opt/projects/boards/colibri-imx6/rootfs/buildroot/output/host/bin:$PATH

make colibri_imx6_defconfig
make zImage -j$(nproc) && cp -v arch/arm/boot/zImage /srv/tftp/zImage-colibri-imx6
make imx6dl-colibri-aster-ipe.dtb && cp -v arch/$ARCH/boot/dts/imx6dl-colibri-aster-ipe.dtb /srv/tftp/
