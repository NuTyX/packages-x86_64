# kde5
#
## Ports for constructing kde5

Contributions are welcome

This git is under construction, for tests only.


### How to test this git :

#### 1. Clone it

    # git clone git://github.com/NuTyX/kde5.git

#### 2. Compile all ports in good order

    # for i in `cat kde5/kde5.lst; do cards depcreate $i; done

#### 3. Install the environment variable and the starter

    # cp -a kde5/qt5.sh /etc/profile.d/
    # cp -a kde5/kf5.sh /etc/profile.d/
    # cp -a kde5/.xinitrc /home/$USER/
    
#### 4. Start it

    # source /etc/profile
    # su - $USER
    $ startx
