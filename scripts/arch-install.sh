#!/bin/bash

# Arch Linux Install
# ==================

# This is the install script, if you would prefer to follow along and manually type commands, see arch-linux.txt

# Pre-Install
# -----------

# if efivars available use uefi boot with systemd-boot
if [[ -e /sys/firmware/efi/efivars ]]; then
	BOOT="uefi"
else
	BOOT="bios"
fi

# test network connection, if no connectivity do not continue
if ! ping -q -c 1 -W 1 archlinux.org >/dev/null; then
	echo "You need to connect to the internet to install Arch."
	exit 1
fi

# set up ntp and wait for ntp to sync
timedatectl set-ntp true

# select which disks to partition
DRIVE=$(lsblk -o name | grep -m1 sd)
echo "Found installation drive: $DRIVE"
echo "Is this correct? y/n: "
read -n 1 CHECK
if [[ $CHECK == "n" ]]; then
	echo "Enter the correct drive. (sdX): "
	read DRIVE
fi

# set up partition table
# if uefi
if [[ $BOOT == "uefi" ]]; then
	parted /dev/$DRIVE \
		mklabel gpt \
		mkpart ESP fat32 1MiB 513MiB \
		set 1 boot on \
		mkpart primary ext4 513MiB 30.5GiB \
		mkpart primary ext4 30.5GiB 100%

	# make uefi /boot filesystem
	mkfs.vfat /dev/sda1

# if bios
else
	parted /dev/$DRIVE \
		mklabel msdos \
		mkpart primary ext4 1MiB 100MiB \
		set 1 boot on \
		mkpart primary ext4 100MiB 30GiB \
		mkpart primary ext4 30GiB 100%

	# make bios /boot filesystem
	mkfs.ext4 /dev/sda1
fi

# make the rest of the filesystems. default to ext4
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

# mount the file systems 1:/boot 2:/ 3:/home
mount /dev/sda2 /mnt
mkdir /mnt/boot /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home

# Installation
# ------------

# select mirrors with rank mirrors
echo "Beginning install, this may take a few minutes!"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.pacnew
rankmirrors -n 10 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist

# Install the base system
pacstrap /mnt base base-devel zsh vim sudo git

# Configuration
# -------------

# Fstab
genfstab -U /mnt > /mnt/etc/fstab

# Chroot
cp chroot.sh /mnt/chroot.sh
chmod 700 /mnt/chroot.sh
arch-chroot /mnt ./chroot.sh
