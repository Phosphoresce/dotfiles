Arch Linux Install
==================

This should be turned into a script to install arch linux on basically any machine

Pre-Install
-----------

### if efivars available use uefi boot with systemd-boot 
ls /sys/firmware/efi/efivars

### test network connection, if no connectivity do not continue
ping archlinux.org

### set up ntp and wait for ntp to sync
timedatectl set-ntp true

### select which disks to partition
fdisk -l  
lsblk

### set up partition table
### if uefi
parted /dev/sda \
	mklabel gpt \
	mkpart ESP fat32 1MiB 513MiB \
	set 1 boot on \
	mkpart primary ext4 513MiB 30.5GiB \
	mkpart primary ext4 30.5GiB 100%

### if bios
parted /dev/sda \
	mklabel msdos \
	mkpart primary ext4 1MiB 100MiB \
	set 1 boot on \
	mkpart primary ext4 100MiB 30GiB \
	mkpart primary ext4 30GiB 100%

### format partitions default to ext4
### if uefi
mkfs.vfat /dev/sda1  
mkfs.ext4 /dev/sda2  
mkfs.ext4 /dev/sda3

### if bios
mkfs.ext4 /dev/sda1  
mkfs.ext4 /dev/sda2  
mkfs.ext4 /dev/sda3

### mount the file systems 1:/boot 2:/ 3:/home
mount /dev/sda2 /mnt  
mkdir /mnt/boot /mnt/home  
mount /dev/sda1 /mnt/boot  
mount /dev/sda3 /mnt/home

Installation
------------

### select mirrors with rank mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.pacnew  
rankmirrors -n 10 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist

### Install the base system
pacstrap /mnt base base-devel zsh vim sudo git

Configuration
-------------

### Fstab
genfstab -U /mnt >> /mnt/etc/fstab

### Chroot
arch-chroot /mnt

### time
rm /etc/localtime  
ln -s /usr/share/zoneinfo/US/Central /etc/localtime  
hwclock --systohc

### Locale
### uncomment en_US.UTF-8 UTF-8
sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen  
locale-gen  
echo "LANG=en_US.UTF-8" > /etc/locale.conf  
cat /etc/vconsole.conf

### hostname
echo "luna" > /etc/hostname  
echo "127.0.1.1 luna.localdomain luna" >> /etc/hosts

### again check for internet connectivity
ping archlinux.org

### usernames and passwords
useradd -m -s /bin/zsh radio  
passwd  
passwd radio

### Boot loader
### if uefi
insert systemd-boot here

### if bios
pacman -S grub  
grub-install --target=i386-pc /dev/sda  
grub-mkconfig -o /boot/grub/grub.cfg  

### finally restart
exit  
umount -R /mnt  
reboot  

Post-Install
------------

### as root
systemctl start dhcpcd  
systemctl enable dhcpcd  
timedatectl set-ntp true  
visudo

### as user
mkdir AUR Documents Downloads Scripts Code Pictures Videos Music  
sudo pacman -S zsh-syntax-highlighting tmux openssh  
git clone https://github.com/Phosphoresce/dotfiles  
unpack dotfiles with insert script here  
bash ~/Scripts/vim.sh

### if virtualbox vm
sudo pacman -S virtualbox-guest-utils

### if xorg
sudo pacman -S xorg-server awesome xorg-xinit rxvt-unicode terminus-font ttf-dejavu
