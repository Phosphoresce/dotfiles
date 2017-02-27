#!/bin/bash

OPTIND=1

usage() {
	echo "Usage:"
	echo "-b to backup pacman package list."
	echo "-i to reinstall pacman packages from previously back up list."
}

while getopts "bi" opt; do
	case "$opt" in
	h|\?)
		usage
		exit 0
		;;
	b)
		b=true
		echo "Backing up pacman pkg list to ~/.pkgs"
		pacman -Qqe > ~/.pkgs
		;;
	i)
		i=true
		echo "Restoring installed packages from ~/.pkgs"
		pacman -S - < ~/.pkgs
	esac
done

shift "$((OPTIND-1))"

if [[ -z "$b" ]] && [[ -z "$i" ]]; then
	usage
	exit 0
fi
