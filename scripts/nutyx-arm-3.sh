#!/bin/bash

#**************************************************
# Written by berlius for nutyx dot org - 2016     #
# Installation script for the NuTyX ARM system    #
# Based on CLFS scripts                           #
#**************************************************

if [ "$EUID" -ne 0 ]; then  
  echo
  echo "It is necessary to be logged as \"root\""
  echo
  echo "Il faut être connecté en tant que \"root\""
  echo
  exit
    
else

export CLFS=/opt/nutyx-arm/arm

mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc 
echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register  


mount -v -o bind /dev ${CLFS}/dev
mount -vt devpts -o gid=5,mode=620 devpts ${CLFS}/dev/pts
mount -vt proc proc ${CLFS}/proc
mount -vt tmpfs tmpfs ${CLFS}/run
mount -vt sysfs sysfs ${CLFS}/sys
[ -h ${CLFS}/dev/shm ] && mkdir -pv ${CLFS}/$(readlink ${CLFS}/dev/shm)


chroot "${CLFS}" /tools/bin/env -i \
    HOME=/root TERM="${TERM}" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    LD_LIBRARY_PATH="/lib:/usr/lib:/tools/lib" \
    /tools/bin/bash --login +h
 
fi

