#!/bin/bash

PWD=$(pwd)

initvim() {
    echo "======================================"
    echo "Adding vim configs soft links to home"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    ln -s $PWD/.vimrc ~/.vimrc
    echo " 1.vimrc added"
    ln -s $PWD/.vim ~/.vim
    echo " 2.vim added"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    echo "Done"
    echo "======================================"
}

clean-home() {
    echo "======================================"
    echo "Deleting"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    echo " .vimrc"
    rm -rf ~/.vimrc 
    # echo " .vim"
    # rm -rf ~/.vim
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    echo "Done."
    echo "======================================"
}

if [ $# -eq 0 ]
then
    echo "ERROR: Insufficient number of arguments passed, exiting"
    exit 1

elif [ $1 = "vim" ] 
then
    initvim

elif [ $1 = "clean" ]
then
    read -p "Cleans configs in your home dir. Are you sure?(y/N): " CONFIRM
    if [ -z  $CONFIRM ]
    then
        echo "Not deleting."
    elif [ $CONFIRM = "y" ] || [ $CONFIRM = "Y" ]
    then
        clean-home
   else
        echo "Not deleting."
    fi

else
    echo "Unknown command, exiting."
    exit 1
fi
