#!/bin/bash

DOT_FILES=( .vimrc .vim .gitconfig .gitignore )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles_min/$file $HOME/$file
done

# 容量に余裕ある環境なら
# [ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"

