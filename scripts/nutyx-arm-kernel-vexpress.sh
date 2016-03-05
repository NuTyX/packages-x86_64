#!/bin/bash

#**************************************************
# Written by berlius for nutyx dot org - 2016     #
# Kernel creation for the NuTyX ARM system        #
#**************************************************

if [ ! -d /cross-tools/bin ]; then
  echo "Le dossier de compilation croisée n'existe pas, la compilation ne peut pas se poursuivre"
  echo
  echo "The \"cross-compile\" folder does not exist, the compilation cannot continue"
  exit 1
fi


export CLFS=/opt/nutyx-arm/arm
export MAKEFLAGS="-j100"
export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
export CLFS_TARGET="arm-none-linux-gnueabi"
export PATH="$PATH:/cross-tools/bin"
export CC="${CLFS_TARGET}-gcc"
export CXX="${CLFS_TARGET}-g++"
export AR="${CLFS_TARGET}-ar"
export AS="${CLFS_TARGET}-as"
export RANLIB="${CLFS_TARGET}-ranlib"
export LD="${CLFS_TARGET}-ld"
export STRIP="${CLFS_TARGET}-strip"


source versions


cd ${CLFS}/sources

echo "effacement du dossier....."
rm -rf linux-$_linux
tar xvf linux-$_linux.tar.xz
cd linux-$_linux

export ARCH=arm
export CROSS_COMPILE=${CLFS_TARGET}-

make mrproper
make vexpress_defconfig
make menuconfig
make zImage dtbs








