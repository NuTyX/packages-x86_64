## Ports for constructing the 'cli-extra and 'gui-extra' collections

Contributions are welcome. If you don't know what it all about, please take the time to read the documentation at
http://www.nutyx.org/en/build-package.html
(version française)
http://www.nutyx.org/fr/build-package.html

It will explain you what's a collection, a git, a port, the tools around 'cards' etc
### Introduction
How does this works ? This git contains the 2 "extra" collection of respectively 'cli' and 'gui'. As those last ones, collections 'cli-extra' and 'gui-extra' needs to be pickup in the right order. Be aware that the 'extra' git contains the biggest binaries packages in size. Means the synchronisation of all the binaries can be very long if your internet connection is slow (100 Mb/Sec or less)
### How does this works:
First we get this git and the core git localy (step1) as normal user. As we want to install a NuTyX base system in a local directory, we need to become root admin. Before installing the NuTyX in a chroot, we adjust some configuration files (step 2) so that the install-nutyx script pickup during the installation (step 3). Once the chroot is in place, we want to make the 2 git projects visible into the chroot (step 4 and 5). Now we are ready to start, so we can enter into the chroot (step 6). As we installed a minimal set of packages, we first need to install the 'devel' packages and some extra tools (step 6 and 7). One this is done, we have 2 choices. Because all the packages of extra collections will depends on core collections (base,cli or gui) we need to synchronise them (step 8).Either we synchronise ALL the existing binaries, means we just want to update a few packages (case 1). Either we want to build ALL the binaries ourself (case 2). So Case 1, we should use option -s and for case 2 it will be -a

### How to test this git:

#### 1. Clone it in your home directory

    $ cd
    $ git clone git://github.com/NuTyX/extra.git
    $ git clone git://github.com/NuTyX/core.git

#### 2. Become root until the end, define and create the directory used by the scripts:

 The script is checking the files /etc/install-nutyx.conf and /etc/install-nutyx.conf.d/cards.conf if they exist, if yes it will use them, so:

    $ su -
    # echo "LFS=/mnt/lfs
    DEPOT=/DEPOT" > /etc/install-nutyx.conf
    # mkdir -p /etc/install-nutyx.conf.d
    # cat > /etc/install-nutyx.conf.d/cards.conf << "EOF"
    dir /DEPOT/gui-extra|http://downloads.nutyx.org
    dir /DEPOT/gui|http://downloads.nutyx.org
    dir /DEPOT/cli-extra|http://downloads.nutyx.org
    dir /DEPOT/cli|http://downloads.nutyx.org
    dir /DEPOT/base|http://downloads.nutyx.org
    base /DEPOT/base
    logdir /var/log/pkgbuild
    EOF
 We need to have a correct pkgmk.conf file as well so, lets create it:
 

    # cat > /etc/install-nutyx.conf.d/pkgmk.conf << "EOF"
    export CFLAGS="-O2 -pipe"
    export CXXFLAGS="${CFLAGS}"
    case ${PKGMK_ARCH} in
        "x86_64"|"")
            export MAKEFLAGS="-j4"
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
    PKGMK_GROUPS=(devel man doc service)
    PKGMK_LOCALES=(fr de it es nl pt da nn sv fi)
    PKGMK_CLEAN="no"
    PKGMK_KEEP_SOURCES="yes"
    PKGMK_SOURCE_DIR="/tmp"
    PKGMK_WORK_DIR="/tmp/work"
    PKGMK_COMPRESS_PACKAGE="yes"
    PKGMK_COMPRESSION_MODE="xz"
    PKGMK_IGNORE_REPO="no"
    PKGMK_IGNORE_COLLECTION="no"
    PKGMK_IGNORE_RUNTIMEDEPS="no"
    EOF

#### 3. Install a base NuTyX system (assume below the user is 'tnut' so adapt to yours)

    # bash /home/tnut/core/scripts/install-nutyx

#### 4. In your chroot Make the directory where the git copy will comes

    # mkdir -v /mnt/lfs/root/{core,extra}

#### 5. Mount your git project (assume below the user is 'tnut' so adapt to yours)

    # mount -o bind /home/tnut/extra /mnt/lfs/root/extra
    # mount -o bind /home/tnut/core /mnt/lfs/root/core

#### 6. Enter now in your chroot

    # bash /home/tnut/core/scripts/install-nutyx -ec

#### 7. Prepare the first execution of the build script

    # get cards.devel git
 
#### 8. If everything is OK, synchronize the core 'base', 'cli' and 'gui' collections binaries

    # cd /root/core
    # bash scripts/base -s
    # bash scripts/cli -s
    # bash scripts/gui -s
    
#### 9. If everything is OK, synchronize all the 'xxx-extra' collections binaries in case of a few updates 

    # cd /root/extra
    # bash scripts/cli-extra -s
    # bash scripts/gui-extra -s

#### 10. If everything is OK, check with cards level what's new

    # cards level

 It should show all the packages available.

#### 11. If you want to re build completely one of the 'xxx-extra' collection from the sources

    # bash scripts/cli-extra -a
    # bash scripts/gui-extra -a


Have fun :)
