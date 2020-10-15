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

initvim
