#!/bin/bash

export WSN_DIR="$HOME/wsn-core"

if [  -d "$WSN_DIR" ]; then
  #echo "Creating WSN directory in $WSN_DIR"
  #mkdir -p $WSN_DIR
  rm -rf $WSN_DIR
fi

MNT_PATH=`docker inspect -f='{{(index .Volumes "/root/wsn-core")}}' wsn`

eval "ln -sf $MNT_PATH $WSN_DIR"

echo "Creating symbolic link to $WSN_DIR."

while true; do
    echo "What is your Github username?"
    read git_user
    while true; do
        read -p "A new git remote, git@github.com:$git_user/wsn-core.git will be added. Continue? (Y/N)" yn
        case $yn in
            [Yy]* ) ( cd $WSN_DIR && git remote add origin git@github.com:$git_user/wsn-core.git ); break;;
            [Nn]* ) break;;
            * ) echo "Please answer Y or N.";;
        esac
    done
    echo "yn is $yn"
    if [[ $yn =~ ^[Yy]$ ]];
    then
        break
    fi
done

while true; do
    eval "cd $WSN_DIR && git pull origin integration"
    
    if [ $? -eq 1 ]; then
        if [ ! -f ~/.ssh/*.pub ]; then
            echo "ssh key doesnt exist. Creating ..."
            ( ssh-keygen -q -t rsa -N "" -f ~/.ssh/id_rsa )
        else
            echo "Please add your ~/.ssh/id_rsa.pub key into your github account."
            break
        fi
    else
        break
    fi
done
echo "Result is $?"


