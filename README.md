## Ports for constructing mate

Contributions are welcome

### How to test this git:

#### 1. Clone it

    # git clone git@github.com/NuTyX/mate.git

#### 2. adjust /etc/cards by adding the ports directory. By default it should be:

      dir /var/lib/pkg/saravane/mate


#### 3. Run the script (in root)

    # bash mate/scripts/mate

This will populate all the directories 

#### 4. build the ports

##### 4.1 With the command "cards depcreate"
    # cards depcreate mate


##### 4.2 With the command "cards create -r" 
This method means you have ALL the binaries of the base,console and desktop collection. You want to build like on the bot.

###### 4.2.1 build a list of package to build

    # bash mate/scritps/mate|cut -d " " -f1 > list

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

and so on. Exemple for level 21:

    1: /mate/mate-common
    1: /mate/mate-icon-theme

Time to build:

    # for i in mate-common mate-icon-theme
    # do
    #   cards create -r $i||break
    # done

It will break at the first failure

Have fun :)
