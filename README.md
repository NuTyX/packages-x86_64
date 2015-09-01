## Ports for constructing mate

Contributions are welcome

### How to test this git:

#### 1. Clone it in your home directory

    # git clone git://github.com/NuTyX/mate.git

#### 2. Get the script to Install a bare houaphan NuTyX:

    # git clone git://github.com/NuTyX/houaphan.git

#### 3. Define and create the directory used by the scripts:

    # export LFS=/mnt/lfs
    # mkdir $LFS

#### 4. Install a bare NuTyX

    # bash houaphan/scripts/install-houaphan

#### 5. Enter in the chroot NuTyX

    # bash houaphan/scripts/install-houaphan -ec

#### 6. As it says review and adjust cards.conf to your needs.

    # check
    # get vim
    # vim /etc/cards.conf

#### 7. In your chroot Make the directory where the git copy will comes

    # mkdir /root/mate

#### 8. Exit and mount your git project (asume below the user is 'tnut') adapt to yours

    # exit
    # mount -o bind /home/tnut/mate /mnt/lfs/root/mate

#### 9. Enter again in your chroot

    # bash houaphan/scripts/install-houaphan -ec
    # cd /root/mate

#### 10. You can now try the following commands:

    # get rsync
    # get git
    # bash scripts/mate

It will print a help included point 1,7 and 8 above. Note that it's even possible to get the available binaries from the mirror.

#### 11. If everything is OK, check with cards level whats new

    # cards level

#### 12. TO BE CONTINUED ...

Have fun :)
