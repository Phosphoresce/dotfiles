#!/bin/bash

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

## should probably check to see if this file exists first.. if not create it
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew
rankmirrors -n 10 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist
