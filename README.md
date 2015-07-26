# kde5
#
## Ports for constructing kde5

Contributions are welcome

### This git is under construction, for tests only.


### How to test this git :

#### 1. Clone it

    # git clone git://github.com/NuTyX/kde5.git

#### 2. Adjust your /etc/cards.conf by adding the ports directories of kde5. By default it should be

    dir /var/lib/pkg/remote/kde5/kde5-extra
    dir /var/lib/pkg/remote/kde5/kde5

#### 3. Copy all the ports in place

    # mkdir -p /var/lib/pkg/remote
    # rsync -a kde5/ /var/lib/pkg/remote/

#### 4. Compile all ports in good order

    # for i in `cat kde5/kde5.lst`; do cards depcreate $i; done

#### 5. Install the environment variable and the starter

    # cp -a kde5/qt5.sh /etc/profile.d/
    # cp -a kde5/kf5.sh /etc/profile.d/
    # cp -a kde5/.xinitrc /home/$USER/
    
#### 6. Start it

    # source /etc/profile
    # su - $USER
    $ startx
