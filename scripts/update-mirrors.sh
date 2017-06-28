#!/bin/bash

if [[ ! -f "/etc/pacman.d/mirrorlist" ]]; then
	echo "Error: no mirrorlist found. Trying to recover..."
	if [[ -f "/etc/pacman.d/mirrorlist.pacnew" ]]; then
		cp /etc/pacman.d/mirrorlist.pacnew /ect/pacman.d/mirrorlist
	elif [[ -f "/etc/pacman.d/mirrorlist.bak" ]]; then
		cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist
	else
		echo "Error: no backup mirrorlists, reinstalling official Arch mirrorlist..."
		sudo pacman -S pacman-mirrorlist
	fi
else
	cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
fi

if [[ ! -f "/etc/pacman.d/mirrorlist.pacnew" ]]; then
	cp /etc/pacman.d/mirrorlist /ect/pacman.d/mirrorlist.pacnew
fi

sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew
rankmirrors -n 10 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist
