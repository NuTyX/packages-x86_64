## Ports for constructing the 'mate' collection

Contributions are welcome

### How to test this git:

#### 1. Clone it in your home directory

    $ cd
    $ git clone git://github.com/NuTyX/mate.git
    $ git clone git://github.com/NuTyX/houaphan.git

#### 2. Become root until the end, define and create the directory used by the scripts:

 The script is checking the files /etc/install-houaphan.conf and /etc/install-houaphan.conf.d/cards.conf if they exist, if yes it will use them, so:

    $ su -
    # echo "LFS=/mnt/lfs
DEPOT=/houaphan" > /etc/install-houaphan.conf
    # mkdir -p /etc/install-houaphan.conf.d
    # echo "dir /houaphan/mate
      dir /houaphan/graphic
      dir /houaphan/console
      dir /houaphan/base|http://downloads.nutyx.org
      dir /houaphan/base-extra|http://downloads.nutyx.org
      base /houaphan/base
      base /houaphan/base-extra
      logdir /var/log/pkgbuild" > /etc/install-houaphan.conf.d/cards.conf

#### 4. Install a bare NuTyX (assume below the user is 'tnut' so adapt to yours)

    # bash /home/tnut/houaphan/scripts/install-houaphan

#### 5. In your chroot Make the directory where the git copy will comes

    # mkdir -v /mnt/lfs/root/{houaphan,mate}

#### 6. Mount your git project (assume below the user is 'tnut' so adapt to yours)

    # mount -o bind /home/tnut/mate /mnt/lfs/root/mate
    # mount -o bind /home/tnut/houaphan /mnt/lfs/root/houaphan

#### 7. Enter now in your chroot

    # bash /home/tnut/houaphan/scripts/install-houaphan -ec

#### 8. Prepare the first execution of the build script

    # get cards.devel wget vim rsync git tar
 
#### 9. If everything is OK, synchronize the bare houaphan binaries

    # cd /root/houaphan
    # bash scripts/base -s
    # bash scripts/console -s
    # bash scripts/graphic -s
    
#### 10. If everything is OK, synchronize the mate binaries and mate-extra binaries

    # cd /root/mate
    # bash scripts/mate -s

#### 11. If everything is OK, check with cards level what's new

    # cards level

 It should shows all the packages available

#### 12. If you want to build mate from the sources

    # bash scripts/mate -a

#### 13. If you want to build the 'mate-extra' from the sources, add the proper line in top of the cards.conf file like this:

  dir /houaphan/mate-extra

 then you are ready to compile the 'mate-extra' collection

   # cd /root/mate-extra
   # bash scripts/mate-extra -s
   # bash scripts/mate-extra -a 

Have fun :)
