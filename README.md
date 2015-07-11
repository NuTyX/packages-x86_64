## Ports for constructing xfce4

Contributions are welcome

### How to test this git:

#### 1. Clone it

    # git clone git://github.com/NuTyX/xfce4.git

#### 2. adjust /etc/cards.conf by adding the ports directory. By default it should be:

      dir /var/lib/pkg/saravane/xfce4


#### 3. Run the script a first time (in root)

    # bash kf5/scripts/xfce4

This will populate all the directories 

#### 4. build the ports

##### 4.1 With the command "cards depcreate"
    # cards depcreate xfce4


##### 4.2 With the command "cards create -r" 
This method means you have ALL the binaries of the base,console and graphic collection. You want to build like on the bot.

###### 4.2.1 build a list of package to build by running the script a second time

    # bash xfce4/scritps/xfce4|cut -d " " -f1 > list

###### 4.2.2 build each package per level

    # for i in `cat list`
    # do
    #   cards level|grep /$i$|grep  ^0:
    # done

It will print a list of package to be build from level 0, if not start do it again with next level

    # for i in `cat list`
    # do
    #  cards level|grep /$i$|grep  ^1:
    # done

and so on. Exemple for level 2:

    2: /xfce4/xfce4-libui

Time to build:

    # for i in xfce4-libui
    # do
    #   cards create -r $i||break
    # done

It will break at the first failure

Have fun :)
