#!/bin/zsh
# Unpack dotfiles scripts docs
rsync -ruv home/ ~
rsync -ruv docs/ ~/Documents
rsync -ruv scripts/ ~/Scripts
sudo rsync -ruv awesome/dark /usr/share/awesome/themes
cp -uv awesome/rc.lua ~/.config/awesome/rc.lua
cp -uv awesome/arch_small.png /usr/share/awesome/icons
