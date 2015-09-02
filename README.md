## Ports for constructing mate

Contributions are welcome

### How to test this git:

#### 1. Clone it in your home directory

    $ cd
    $ git clone git://github.com/NuTyX/mate.git

#### 2. Get the script to Install a bare houaphan NuTyX:

    $ git clone git://github.com/NuTyX/houaphan.git
    $ git clone git://github.com/NuTyX/extra.git

#### 3. Become root until the end, define and create the directory used by the scripts:

    $ su -
    # echo export LFS=/mnt/lfs >> /root/.bashrc
    # export LFS=/mnt/lfs
    # mkdir $LFS

#### 4. Install a bare NuTyX (assume below the user is 'tnut' so adapt to yours)

    # bash /home/tnut/houaphan/scripts/install-houaphan

#### 5. Enter in the chroot NuTyX (assume below the user is 'tnut' so adapt to yours)

    # bash /home/tnut/houaphan/scripts/install-houaphan -ec

#### 6. Create cards.conf to your needs

    # cat > /etc/cards.conf << "EOF"
    dir /root/mate/mate-extra
    dir /root/mate/mate
    dir /root/extra/graphic-extra
    dir /root/houaphan/graphic
    dir /root/extra/console-extra
    dir /root/houaphan/console
    dir /root/extra/base-extra
    dir /root/houaphan/base
    logdir /var/log/pkgbuild
    locale fr
    base /root/houaphan/base
    base /root/extra/base-extra
    EOF

#### 7. In your chroot Make the directory where the git copy will comes

    # mkdir /root/mate
    # mkdir /root/houaphan
    # mkdir /root/extra

#### 8. Exit and mount your git project (assume below the user is 'tnut' so adapt to yours)

    # exit
    # mount -o bind /home/tnut/mate /mnt/lfs/root/mate
    # mount -o bind /home/tnut/houaphan /mnt/lfs/root/houaphan
    # mount -o bind /home/tnut/extra /mnt/lfs/root/extra

#### 9. Enter again in your chroot

    # bash houaphan/scripts/install-houaphan -ec

#### 10. Prepare the first execution of the build script

    # check
    # get vim
    # get rsync
    # get git
    # cd /root/mate
    # bash scripts/mate
 
It will print a help including points 1,7 and 8 above.
Note that it's even possible to get the available binaries from the mirror by using the argument -s as below.

#### 11. If everything is OK, synchronize the bare houaphan binaries

    # cd /root/houaphan
    # bash scripts/base -s
    # bash scripts/console -s
    # bash scripts/graphic -s
    
#### 12. If everything is OK, synchronize the mate binaries

    # cd /root/mate
    # bash scripts/mate -s

#### 13. If everything is OK, check with cards level what's new

    # cards level

#### 14. If you want to build mate from the sources

    # bash scripts/mate -a

#### 12. TO BE CONTINUED ...

Have fun :)
