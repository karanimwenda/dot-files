#!/bin/bash

PWD=$(pwd)

initvim() {
    echo "======================================"
    echo "Adding vim configs soft links to home"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    ln -s $PWD/.vimrc ~/.vimrc
    echo " .vimrc added"
    ln -s $PWD/.vim/after ~/.vim/after
    echo " .vim/after added"
    ln -s $PWD/.vim/coc-settings.json ~/.vim/coc-settings.json
    echo " .vim/coc-settings.json added"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    echo "Done"
    echo "======================================"
}

clean-home() {
    echo "======================================"
    echo "Deleting"
    echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    echo "1. Vim Files:"
    echo "   .vimrc"
    rm -rf ~/.vimrc 
    echo "   .vim/coc-settings.json"
    rm -rf ~/.vim/coc-settings.json
    echo "   .vim/after"
    rm -rf ~/.vim/after
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
