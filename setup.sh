#! /usr/bin/env bash

files=( .vimrc .gvimrc .vim utilities .bashrc )

git submodule update --init --recursive

# backup
mkdir ~/backup
for file in ${files[@]}; do
  cp -r ~/$file backup/$file
done

# create soft links
for file in ${files[@]}; do
  ln -s backup/$file ~/$file 
done