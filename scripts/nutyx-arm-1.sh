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
fi

export CLFS=/opt/nutyx-arm/arm

mkdir -pv ${CLFS}/sources
chmod -v a+wt ${CLFS}/sources
    
if [ -L /tools ]; then 
   rm -v /tools
fi
    
if [ -L /cross-tools ]; then 
   rm -v /cross-tools
fi

install -v -m755 -d ${CLFS}/cross-tools
install -v -m755 -d ${CLFS}/tools    
ln -sv ${CLFS}/tools /
ln -sv ${CLFS}/cross-tools /


if [ -d /home/clfs ]; then
  rm -rf /home/clfs
  userdel clfs
  groupdel clfs
fi

groupadd clfs
useradd -s /bin/bash -g clfs -d /home/clfs clfs
mkdir -pv /home/clfs
chown -v clfs:clfs /home/clfs

chown -v clfs ${CLFS}/tools
chown -v clfs ${CLFS}/cross-tools
chown -v clfs ${CLFS}/sources


cp -v  nutyx-arm-2.sh /home/clfs/nutyx-arm-2.sh
cp -v  versions /home/clfs/versions
cp -v  nutyx-arm-3.sh /bin/nutyx-arm
cp -v  nutyx-arm-4.sh ${CLFS}/nutyx-arm-4.sh
cp -v  versions ${CLFS}/versions
cp -v  glibc.locales.supported ${CLFS}/sources
mkdir -pv ${CLFS}/etc
cp -v  blfs-bootscripts ${CLFS}/etc/blfs-bootscripts


chmod 477 /home/clfs/nutyx-arm-2.sh
chmod 477 /bin/nutyx-arm
chmod 477 ${CLFS}/nutyx-arm-4.sh

cat > /home/clfs/.bash_profile << "EOF"
exec env -i HOME=${HOME} TERM=${TERM} PS1='\u:\w\$ ' /bin/bash
EOF

cat > /home/clfs/.bashrc << "EOF"
set +h
umask 022
CLFS=/opt/nutyx-arm/arm
LC_ALL=POSIX
PATH=/cross-tools/bin:/bin:/usr/bin
export CLFS LC_ALL PATH
unset CFLAGS CXXFLAGS PKG_CONFIG_PATH
EOF

mkdir -pv ${CLFS}/{dev,etc,proc,run,sys}
mknod -m 600 ${CLFS}/dev/console c 5 1
mknod -m 666 ${CLFS}/dev/null c 1 3
[ -h ${CLFS}/dev/shm ] && mkdir -pv ${CLFS}/$(readlink ${CLFS}/dev/shm)


cat > ${CLFS}/etc/passwd << "EOF"
root::0:0:root:/root:/bin/bash
bin:x:1:1:/bin:/bin/false
daemon:x:2:6:/sbin:/bin/false
messagebus:x:27:27:D-Bus Message Daemon User:/dev/null:/bin/false
nobody:x:65534:65533:Unprivileged User:/dev/null:/bin/false
EOF

cat > ${CLFS}/etc/group << "EOF"
root:x:0:
bin:x:1:
sys:x:2:
kmem:x:3:
tty:x:5:
tape:x:4:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:27:
mail:x:30:
wheel:x:39:
nogroup:x:65533:
EOF

cat > ${CLFS}/etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF



if [ -f /opt/nutyx-arm/qemu-static/usr/bin/qemu-arm ]; then
  mkdir -pv /opt/nutyx-arm/arm/usr/bin
  cp -v /opt/nutyx-arm/qemu-static/usr/bin/qemu-arm /opt/nutyx-arm/arm/usr/bin/qemu-arm-static
else
  echo
  echo
  echo "You must install "qemu-static" to use the development environment."
  echo
  echo "Vous devez installer "qemu-static" pour utiliser l'environnement de développement"
  echo
  echo
  exit 1
fi

[ ! -d ${CLFS}/root ] && mkdir -pv ${CLFS}/root
#[ ! -d ${CLFS}/root/current ] && git clone git://github.com/nutyx/current.git ${CLFS}/root/current
[ ! -d ${CLFS}/root/extra ] && git clone git://github.com/nutyx/extra.git ${CLFS}/root/extra
[ ! -d ${CLFS}/root/houaphan ] && git clone git://github.com/nutyx/houaphan.git ${CLFS}/root/houaphan
[ ! -d ${CLFS}/root/mate ] && git clone git://github.com/nutyx/mate.git ${CLFS}/root/mate
[ ! -d ${CLFS}/root/kde5 ] && git clone git://github.com/nutyx/kde5.git ${CLFS}/root/kde5
[ ! -d ${CLFS}/root/gnome ] && git clone git://github.com/nutyx/gnome.git ${CLFS}/root/gnome
[ ! -d ${CLFS}/root/enlightenment ] && git clone git://github.com/nutyx/enlightenment.git ${CLFS}/root/enlightenment
[ ! -d ${CLFS}/root/lxqt ] && git clone git://github.com/nutyx/lxqt.git ${CLFS}/root/lxqt
[ ! -d ${CLFS}/root/kde ] && git clone git://github.com/nutyx/kde.git ${CLFS}/root/kde
[ ! -d ${CLFS}/root/xfce4 ] && git clone git://github.com/nutyx/xfce4.git ${CLFS}/root/xfce4
[ ! -d ${CLFS}/root/cinnamon ] && git clone git://github.com/nutyx/cinnamon.git ${CLFS}/root/cinnamon
[ ! -d ${CLFS}/root/lxde ] && git clone git://github.com/nutyx/lxde.git ${CLFS}/root/lxde

echo
echo
echo "Logged in as user \"clfs\"  ... "
echo "Now run \"./nutyx-arm-2.sh\""
echo
echo "Connecté comme utilisateur \"clfs\"  ... "
echo "Maintenant, exécutez \"./nutyx-arm-2.sh\""
echo
echo

su - clfs




