## Ports for constructing xfce4

Contributions are welcome

### How to test this git:

#### 1. Clone it in your home directory

    # git clone git://github.com/NuTyX/xfce4.git

#### 2. Get the script to Install a bare houaphan NuTyX:

    # export LFS=/mnt/lfs
    # mkdir $LFS
    # wget http://downloads.nutyx.org/install-houaphan{,.md5sum}
    # wget http://downloads.nutyx.org/enter-chroot{,.md5sum}

#### 3. Check the validity of the scripts:

    # md5sum -c install-houaphan.md5sum

   install-houaphan: OK

    # md5sum -c enter-chroot.md5sum

   enter-chroot: OK

#### 4. Install a bare NuTyX

    # bash install-houaphan

#### 5. Enter in the chroot NuTyX

    # bash enter-chroot

#### 6. As it says review and adjust cards.conf to your needs.

    # check
    # get vim
    # vim /etc/cards.conf


#### 7. In your chroot Make the directory where the git copy will comes

    # mkdir /root/xfce4

#### 8. Exit and mount your git project (asume below the user is 'tnut') adapt to yours

    # mount -o bind /home/tnut/xfce4 /mnt/lfs/root/xfce4

#### 9. Enter again in your chroot

    # bash enter-chroot
    # cd /root/xfce4

#### 10. you can now try the following command:

    # bash script/xfce4

It will print a help included point 1,7 and 8 above. Note that it's even possible to get the available binaries from the mirror.


#### 11. If everythin OK, check with cards level whats new

    # cards level

#### 12. TO BE CONTINUE ...

Have fun :)
