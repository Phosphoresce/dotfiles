#!/bin/bash

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

if [[ ! -f "/etc/pacman.d/mirrorlist.pacnew" ]]; then
	cp /etc/pacman.d/mirrorlist /ect/pacman.d/mirrorlist.pacnew
fi

sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew
rankmirrors -n 10 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist
