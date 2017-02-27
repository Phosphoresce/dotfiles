#!/bin/zsh
# Unpack dotfiles scripts docs
cp -ruv ./home/.* ~
cp -uv ./docs/* ~/Documents
cp -uv ./scripts/* ~/Scripts
cp -uv ./awesome/rc.lua ~/.config/awesome/rc.lua
cp -uv ./awesome/arch_small.png /usr/share/awesome/icons
sudo cp -ruv ./awesome/dark /usr/share/awesome/themes
