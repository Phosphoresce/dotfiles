#!/bin/bash

#Install Vundle and plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.local/share/nvim/site
ln -s ~/.vimrc ~/.config/nvim/init.vim
