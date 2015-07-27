# kde5
#
## Ports for constructing kde5

Contributions are welcome

### This git is under construction, for tests only.


### How to test this git :

#### 1. Clone it

    # git clone git://github.com/NuTyX/kde5.git

#### 2. Adjust your /etc/cards.conf by adding the ports directories of kde5. By default it should be

    dir /houaphan/kde5-extra
    dir /houaphan/kde5

#### 3. Copy all the ports in place

    # cd kde5
    # bash scripts/kde5
    # bash scripts/kde5-extra

#### 4. Compile all ports in the right order

There are severall methods. One could be via the same script. But we need to get a correct order list of packages to build.

    # for i in `cards level -I| cut -d " " -f2|grep houaphan/kde5`; do echo `basename $i`;done > ~/list

This means you have all the binaries from the base,console and graphic collections in place. Now We can build them:

    # for i in `cat ~/list`; do bash scripts/kde5 $i||break; done

It will stop at the first failure

#### 5. Install the environment variable and the starter

    # cp -a kde5/kf5.sh /etc/profile.d/
    # cp -a kde5/.xinitrc /home/$USER/
    
#### 6. Start it

    # source /etc/profile
    # su - $USER
    $ startx
