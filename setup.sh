#! /usr/bin/env bash

files=".vimrc .gvimrc .vim utilities .bashrc"

dotdir=$HOME/dotfiles

git submodule update --init --recursive

# backup
mkdir ~/backup
for file in $files; do
  echo "backup $HOME/$file"
  if [ -e "$HOME/$file" ]; then
    mv "$HOME/$file" "$HOME/backup/$file"
  fi
  ln -s $dotdir/$file $HOME/$file 
done

