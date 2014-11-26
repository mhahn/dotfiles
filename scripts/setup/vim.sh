#!/bin/bash

if [ ! -d ~/.vim/bundle/neobundle.vim ]
then
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi
