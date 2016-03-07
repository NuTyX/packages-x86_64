#!/tools/bin/bash

#**************************************************
# Written by berlius for nutyx dot org - 2016     #
# Installation script for the NuTyX ARM system    #
# Based on CLFS scripts                           #
#**************************************************

ROOTDEV=mmcblk0p2
ROOTFS=ext4
SWAPDEV=

source versions

export PKGMK_ARCH=`uname -m`
export MAKEFLAGS="-j100"
export LD_LIBRARY_PATH="/lib:/usr/lib:/tools/lib"
export CPATH="/usr/include:/tools/include"
export LIBRARY_PATH="/usr/lib:/lib:/tools/lib"

ln -s /tools/lib/ld-linux.so.3 /lib/ld-linux.so.3

chown -Rv 0:0 /tools
chown -Rv 0:0 /cross-tools

mkdir -pv /{bin,boot,dev,{etc/,}opt,home,lib,mnt}
mkdir -pv /{proc,media/{floppy,cdrom},run/shm,sbin,srv,sys}
mkdir -pv /var/{lock,log,mail,spool}
mkdir -pv /var/{opt,cache,lib/{misc,locate},local}
install -dv -m 0750 /root
install -dv -m 1777 {/var,}/tmp
ln -sv ../run /var/run
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /usr/{,local/}share/{doc,info,locale,man}
mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /usr/{,local/}share/man/man{1..8}
mkdir -pv /var/lib/pkg/DB
mkdir -pv /var/log/pkgbuild

ln -sv /tools/bin/{bash,cat,echo,grep,pwd,stty} /bin
ln -sv /tools/bin/file /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sv /tools/lib/libstdc++.so{.6,} /usr/lib
sed -e 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
ln -sv bash /bin/sh

ln -sv /proc/self/mounts /etc/mtab

touch /var/log/{btmp,lastlog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp

cat > /usr/bin/which << "EOF"
#!/bin/bash
type -pa "$@" | head -n 1 ; exit ${PIPESTATUS[0]}
EOF

chmod -v 755 /usr/bin/which
chown -v root:root /usr/bin/which

cat > /etc/resolv.conf << "EOF"
# Google IPv4 nameservers
nameserver 8.8.8.8
nameserver 8.8.4.4

EOF


# Modifiez la valeur de la variable UTC ci-dessous pour une valeur de 0 (zéro) si l'horloge matérielle n'est pas réglée sur l'heure UTC.
# Change the value of the UTC variable below to a value of 0 (zero) if the hardware clock is not set to UTC time. 

cat > /etc/sysconfig/clock << "EOF"
# Begin /etc/sysconfig/clock

UTC=1

# End /etc/sysconfig/clock
EOF

cat > /etc/profile << "EOF"
# Begin /etc/profile

for f in /etc/bash_completion.d/*
do
  if [ -e ${f} ]; then source ${f}; fi
done
unset f

export INPUTRC=/etc/inputrc
EOF

cat >> /etc/profile << "EOF"

export LANG=fr_FR.UTF-8

# End /etc/profile
EOF

cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type   options          dump  fsck
#                                                         order

/dev/$ROOTDEV     /            $ROOTFS  defaults         1     1
/dev/$SWAPDEV     swap         swap   pri=1            0     0
devpts         /dev/pts     devpts gid=5,mode=620   0     0
shm            /dev/shm     tmpfs  defaults         0     0

# End /etc/fstab
EOF

cd /etc/sysconfig/network-devices &&
mkdir -v ifconfig.eth0 &&
cat > ifconfig.eth0/dhcpcd << "EOF"
ONBOOT="yes"
SERVICE="dhcpcd"

# Start Command for DHCPCD
DHCP_START="-q"

# Stop Command for DHCPCD
DHCP_STOP="-k"
EOF


cat > /etc/cards.conf << "EOF"

## Dossiers où trouver les recettes
## L'ordre est important
## Premier trouvé premier compilé et/ou premier installé
##
## A noter que c'est bien les paquets de "base" en dernier et les paquets "gui-extra" en premier
## et que l'on specifie le dossier parent du jeu de paquets:
## Le contenu d'un dossier paquet ressemble donc à ceci dans le cas de:
##
##
## Folders where should be located the recepts
## The order is important 
## First found first compiled and/or first installed
##
## Note that it's the "base" packages which will be the last and the "desktop" one the first
## and that we do specify the parent folder of the set of packages category:
## The content of a folder package look like this in the case of:
##
## /var/lib/pkg/depot/cli/alsa-utils/.PKGREPO
##                                  /Pkgfile
##                                  /alsa-utils123468110i686.cards.tar.xz
##                                  /alsa-utils123468110x86_64.cards.tar.xz
##                                  /alsa-utils.doc123468110any.cards.tar.xz
##                                  /alsa-utils.post-install
##                                  /...

## A COLLECTION CAN BE MADE OF ports only OR MADE OF binaries
## The only criteria determining this is: with or without '|<url adress>' at the end of a line starting with the
## keyword 'dir'. Followings examples:

## This is a port collection located in '/usr/ports/my_ports'
# dir /usr/ports/my_ports

## This is a binaries collection located in '/depot/x86_64/gui|http://downloads.nutyx.org'. It will all
##the binaires from the 'http://downloads.nutyx.org' mirror
# dir /depot/x86_64/gui|http://downloads.nutyx.org

## Uncomment following lines if you want to compile your own ports
## Use then the command 'ports -u' to get all the ports
## This are examples of directories.
## IMPORTANT NOTE: They are severall methods to build your own ports.
## !!!! Read the documentation first  at http://www.nutyx.org !!!!
##


# dir /usr/ports/gui-extra
# dir /usr/ports/gui
# dir /usr/ports/cli-extra
# dir /usr/ports/cli
# dir /usr/ports/base-extra
# dir /usr/ports/base

## The NuTyX name and version are found in the /var/lib/pkg/nutyx-version file
## The Colletion name (xfce4-extra, xfce4, gui, gui-extra, cli, cli-extra, base, base-extra)
## must exist on the mirror http://downloads.nutyx.org (in this case)
## Checkout for your version what's are the available collections at http://downloads.nutyx.org/<NuTyX-version>
#
## Le nom et la version de NuTyX se trouvent dans le fichier /var/lib/pkg/nutyx-version
## Le nom des collections (xfce4-extra, xfce4, gui, gui-extra,cli, cli-extra, base, base-extra)
## doivent exister sur le mirroir http://downloads.nutyx.org (dans ce cas)
## Vérifiez quelles sont les collections disponibles sur http://downloads.nutyx.org/<NuTyX-version>
#
# dir /var/lib/pkg/depot/enlightenment-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/enlightenment|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/cinnamon-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/cinnamon|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/gnome-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/gnome|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/kde5-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/kde5|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/kde-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/kde|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/mate-extra|http://downloads.nutyx.org
# dir /var/lib/pkg/depot/mate|http://downloads.nutyx.org
dir /root/xfce4/xfce4-extra
dir /root/xfce4/xfce4
dir /root/extra/gui-extra
dir /root/houaphan/gui
dir /root/extra/cli-extra
dir /root/houaphan/cli
dir /root/extra/base-extra
dir /root/houaphan/base
dir /root/mate/mate-extra
dir /root/mate/mate
dir /root/kde/kde-extra
dir /root/kde/kde
dir /root/kde5/kde5-extra
dir /root/kde5/kde5
dir /root/lxqt/lxqt-extra
dir /root/lxqt/lxqt
dir /root/lxde/lxde-extra
dir /root/lxde/lxde
dir /root/cinnamon/cinnamon
dir /root/gnome/gnome-extra
dir /root/gnome/gnome
dir /root/enlightenment/enlightenment-extra
dir /root/enlightenment/enlightenment


# A collection can be

## Cards needs to know if he's allowed to removing the package you pass to the command argument:
##   cards remove <packagename>
## Because yes, we don't want do delete the glibc package for example :)
## Moreover if need to come back to a base system, following folder(s) should contains packages
##
##
## Cards doit vérifier si il peut supprimer le paquet passé en argument:
#    cards remove <packagename>
#  En effet, nous ne souhaitons pas supprimer le paquet glibc par exemple :)
#  De plus, si l'on veut revenir à un système de base, les dossiers suivant doivent contenir des paquets
#
## In the following setting, packages from base system and base-extra will not be deleted
## Dans le cas ci-dessous, les paquets des collections base et base-extra ne seront pas supprimés
base /root/houaphan/base
base /root/extra/base-extra

##
## We can specify which locale we want, it's possible to mention as many locale we want
## As the following exemple germans, deutch, and french locales
## The command setup-nutyx -cl add the selected locale into cards.conf file
##
## On peut spécifier quelle(s) locale(s) doivent être installées
## La commande setup-nutyx -cl ajoute la locale selectionnée dans le fichier cards.conf
##
# locale de
# locale nl
# locale fr


## If you plan to build your Package you will like this option otherwise just ignore it
##
## Cards can log the output of the creation of the final package when a:
#
#   cards create -r <nom of package>
#
## if following variable is set and is refering a folder: the compilation will be logged
##
##
## Si vous avez l'intention de construire vos propre paquets, cette option va vous plaire
## Si non, ignorez-la
##
## Cards va enrégistrer la sortie de la création du paquet final lors d'un:
#
#   cards create -r <nom de paquet >
#
##  si la variable ci-dessous est définie et pointe sur un dossier
logdir /var/log/pkgbuild


EOF



cat > /etc/pkgmk.conf << "EOF"

#
# /etc/pkgmk.conf: pkgmk(8) configuration
#

export PKGMK_ARCH=`uname -m`
export CFLAGS="-O2 -pipe"
export CXXFLAGS="${CFLAGS}"

case ${PKGMK_ARCH} in
        "x86_64"|"armv7l")
		export MAKEFLAGS="-j100"
                ;;
        "i686")
                export CFLAGS="${CFLAGS} -m32"
                export CXXFLAGS="${CXXFLAGS} -m32"
                export LDFLAGS="${LDFLAGS} -m32"
                ;;
        *)
                echo "Unknown architecture selected! Exiting."
                exit 1
                ;;
esac

# Those settings are typically set for packaging
# without sub packages and only french locale
# They are also the default ones
#
# PKGMK_GROUPS=()
# PKGMK_LOCALES=(fr)
# PKGMK_COMPRESS_PACKAGE="no"
# PKGMK_CLEAN="yes"
# PKGMK_IGNORE_FOOTPRINT="yes"
# PKGMK_KEEP_SOURCES="no"
# PKGMK_SOURCE_DIR="$PWD"
# PKGMK_WORK_DIR="$PWD/work"
# PKGMK_IGNORE_REPO="yes"
# PKGMK_IGNORE_COLLECTION="yes"
# PKGMK_IGNORE_RUNTIMEDEPS="yes"
#
# Those settings are used for a bot
#
# PKGMK_GROUPS=(devel man doc service)
# PKGMK_LOCALES=(fr de it es nl pt da nn sv fi)
PKGMK_CLEAN="no"
# PKGMK_KEEP_SOURCES="yes"
# PKGMK_SOURCE_DIR="/tmp"
# PKGMK_WORK_DIR="/tmp/work"
PKGMK_COMPRESS_PACKAGE="yes"
PKGMK_COMPRESSION_MODE="xz"
PKGMK_IGNORE_REPO="no"
PKGMK_IGNORE_COLLECTION="no"
# PKGMK_IGNORE_RUNTIMEDEPS="no"
#
# Others default set variables
#
# PKGMK_SOURCE_MIRRORS=()
# PKGMK_DOWNLOAD="no"
# PKGMK_IGNORE_FOOTPRINT="yes"
# PKGMK_IGNORE_NEW="yes"
# PKGMK_IGNORE_MD5SUM="yes"
# PKGMK_NO_STRIP="no"
# PKGMK_WGET_OPTS=""

# End of file


EOF




cd /sources

cd cards-$_cards

cd scripts
# force installation sur des liens comme /bin/bash, /bin/sh, /usr/lib/libgcc* etc...
# replacing links like /bin/bash, /bin/sh, /usr/lib, /libgcc* with new recipe
cp -vf pkgmk.in pkgmk.in.orig
sed 's/COMMAND="pkgadd $PKGMK_PACKAGE_DIR/COMMAND="pkgadd -f $PKGMK_PACKAGE_DIR/' pkgmk.in.orig > pkgmk.in

# adaptation à ARM
sed "s/x86_64/armv7l/" pkgmk.in > /bin/pkgmk
chmod 777 /bin/pkgmk
ln -sv ./pkgmk ${CLFS}/bin/pkgrm 
ln -sv ./pkgmk ${CLFS}/bin/pkginfo
cd ..

cp -vf Makefile.inc Makefile.inc.orig
sed 's/Werror/Wall/' Makefile.inc.orig > Makefile.inc


# pkg-config n'est pas encore installé
# pkg-config is not installed yet
cd src
cp -vf Makefile Makefile.orig
sed 's/-static $(LIBARCHIVELIBS)/$(LDFLAGS)/' Makefile.orig > Makefile
cd ..
cp -vf Makefile.inc Makefile.inc.orig
sed 's/LIBARCHIVELIBS := $(shell pkg-config --libs --static libarchive)/ /' Makefile.inc.orig > Makefile.inc
cp -vf Makefile.inc Makefile.inc.orig
sed 's/LIBCURLLIBS := $(shell pkg-config --libs --static libcurl)/ /' Makefile.inc.orig > Makefile.inc
cp -vf Makefile.inc Makefile.inc.orig
sed 's/LDFLAGS += $(LIBARCHIVELIBS)/LDFLAGS += -L\/tools\/lib -static -larchive -lnettle -lacl -lattr -lexpat -lbz2 -llzo2 -llzma -lz /' Makefile.inc.orig > Makefile.inc

make pkgadd 2>&1 | tee -a /sources/clfs.log || exit 1
cp -v src/pkgadd /bin/pkgadd
chmod -v 777 /bin/pkgadd
cd ..


##############################################################################################
# PERL a souvent des problèmes avec la compilation croisée                                #
# nous allons donc l'installer dans "tools" avec l'environnement de compilation finale       #
#                                                                                            #
# Perl often has problems with cross compilation                                             #
# we will thus install it in “tools” with the environment of final compilation               #
##############################################################################################
 
echo "######## perl-$_perl - tools #####################################" | tee -a /sources/clfs.log
echo | tee -a /sources/clfs.log

cd perl-$_perl

sed -i 's@/usr/include@/tools/include@g' ext/Errno/Errno_pm.PL
 
./configure.gnu \
    --prefix=/tools \
    -Dcc="gcc" 2>&1 | tee -a /sources/clfs.log
    
make 2>&1 | tee -a /sources/clfs.log
make install | tee -a /sources/clfs.log

ln -sfv /tools/bin/perl /usr/bin

cd ..
rm -rf perl-$_perl
echo | tee -a /sources/clfs.log

###############################################

cd /root/houaphan/base/glibc-arm

pkgmk -d -i 2>&1 | tee -a /var/log/pkgbuild/glibc-arm.log || exit 1


###############################################

gcc -dumpspecs | \
perl -p -e 's@/tools/lib/ld@/lib/ld@g;' \
     -e 's@/tools/lib32/ld@/lib32/ld@g;' \
     -e 's@/tools/lib64/ld@/lib64/ld@g;' \
     -e 's@\*startfile_prefix_spec:\n@$_/usr/lib/ @g;' > \
     $(dirname $(gcc --print-libgcc-file-name))/specs
     
###############################################

cp -av /root/houaphan/cli/nettle /root/houaphan/base
cp -av /root/houaphan/cli/libidn /root/houaphan/base
cp -av /root/houaphan/cli/openldap /root/houaphan/base
cp -av /root/extra/base-extra/dhcpcd /root/houaphan/base
cp -av /root/houaphan/base-arm/* /root/houaphan/base/

ln -sv /tools/bin/env /usr/bin/env
ln -sv /tools/bin/install /usr/bin/install



###############################################

cd /root/houaphan/base


for f in m4 gmp-arm mpfr mpc isl-arm zlib-arm bison flex binutils gcc-arm sed  \
         pkg-config ncurses-arm shadow util-linux procps-ng e2fsprogs autoconf automake coreutils \
         iana-etc libtool iproute2 bzip2 gdbm groff perl readline  bash bc pam \
         diffutils file gawk findutils gettext grep gperf less gzip \
         kbd libpipeline man-db make xz kmod patch libcap psmisc \
         sysklogd sysvinit tar texinfo eudev dhcpcd openssl expat lzo attr acl \
         curl libarchive eudev pciutils nasm lvm2 wget rsync gpm openssh dialog \
         squashfs libidn nettle openldap ca-certificates cards-arm
            
            
         do
            
         cd $f
         pkgmk -d -i -f 2>&1 | tee -a /var/log/pkgbuild/$f.log || exit 1
         cd ..
              
         done


###############################################

rm -v /bin/pkgmk
rm -v /bin/pkgrm
rm -v /bin/pkginfo
rm -v /bin/pkgadd

cd /sources/bootscripts-cross-lfs-3.0-$_bootscripts

make install-bootscripts
make install-network

make install-service-dhcpcd

cd /etc/sysconfig/network-devices
mkdir -pv ifconfig.$ETH
cat > ifconfig.$ETH/dhcpcd << "EOF"
ONBOOT="yes"
SERVICE="dhcpcd"

# Start Command for DHCPCD
DHCP_START="-q"

# Stop Command for DHCPCD
DHCP_STOP="-k"
EOF

rm -rf /etc/rc.d/rc3.d/*
rm -rf /etc/rc.d/rcsysinit.d/*

ln -sv ../init.d/modules /etc/rc.d/rcsysinit.d/S05modules
ln -sv ../init.d/udev /etc/rc.d/rcsysinit.d/S10udev
ln -sv ../init.d/mountfs /etc/rc.d/rcsysinit.d/S40mountfs
ln -sv ../init.d/cleanfs /etc/rc.d/rcsysinit.d/S45cleanfs
ln -sv ../init.d/sysctl /etc/rc.d/rcsysinit.d/S90sysctl

###############################################

for f in blackbox bspwm fluxbox flwm icewm jwm lumina-desktop cinnamon \
         openbox entlightenment gnome-session kde kde5 lxde-session \
         lxqt mate-desktop xfce4-wm      

         do
         
         echo  $f
         
         done
echo
echo 
echo "Do you want to set up a DESKTOP. If so copy and paste the name of the recipe above."
echo "If not type \"enter\""
echo
echo "Voulez-vous installer un bureau. Si oui copiez-coller le nom de sa recette ci dessus."
echo "Si non tapez \"entrée\""
echo
echo 

read DESKTOP


case $DESKTOP in 

     blackbox | bspwm | fluxbox | flwm | icewm | jwm | lumina-desktop | cinnamon | \
     openbox | entlightenment | gnome-session | kde | kde5 | lxde-session | \
     lxqt | mate-desktop | xfce4-wm)
     
     cards depcreate $DESKTOP ;;
     
     
     *)
     echo
     echo "No DESKTOP has been installed" 
     echo
     echo "Pas de bureau installé" ;;
     
esac  

###############################################

cd /sources/u-boot-$_uboot/configs
ls
cd ..
echo
echo
echo "Select a u-boot template by copying and pasting"
echo
echo "Selectionnez un modèle u-boot par copier-coller"
echo 
echo

read m

make $m
make all

###############################################


echo
echo
echo "compilation is complete, NuTyX is ready"
echo
echo "compilation terminée, NuTyX est prête"
echo
echo






