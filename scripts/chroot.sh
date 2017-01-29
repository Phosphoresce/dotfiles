# time
rm /etc/localtime
ln -s /usr/share/zoneinfo/US/Central /etc/localtime
hwclock --systohc

# Locale
# uncomment en_US.UTF-8 UTF-8
sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
cat /etc/vconsole.conf

# hostname
echo "Choose your host name: "
read HOSTNAME
echo "$HOSTNAME" > /etc/hostname
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts

# usernames and passwords
echo "Choose a user name: "
read $USER
useradd -m -s /bin/zsh $USER
echo "Enter a secure root password."
passwd
echo "Enter a secure user password."
passwd $USER

# Boot loader
# if uefi
#<insert systemd-boot here>

# if bios
pacman -Sq --noconfirm grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# finally restart
echo "Time to reboot!"
echo "Type 'exit', 'umount -R /mnt', and 'reboot' when you are ready."
