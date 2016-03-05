#!/bin/bash

#**************************************************
# Written by berlius for nutyx dot org - 2016     #
# Image creation for the NuTyX ARM system         #
#**************************************************

modprobe cryptoloop

losetup -D

echo
echo "création du fichier en cours......." 
echo
echo "creation of the file in progress..." 
echo

dd if=/dev/zero of=nutyx.img bs=1G count=4

mkdir -pv mnt1
mkdir -pv mnt2 


fdisk nutyx.img

losetup -f -P nutyx.img

mkdosfs /dev/loop0p1

mkfs.ext4 /dev/loop0p2

mount /dev/loop0p1 mnt1

mount /dev/loop0p2 mnt2

rsync -av --exclude sources --exclude cross-tools --exclude tools /opt/nutyx-arm/arm/ mnt2

umount mnt1
umount mnt2
losetup -D













