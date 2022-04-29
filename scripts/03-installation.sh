# load configs
source './config/colors.conf'
source './config/install.conf'
source './config/functions.sh'

echo ""

print_step 03 Starting installation process

echo ""

# install essential packages
print_message "Installing essential packages"
echo ""
FORMATED_ESSENTIAL_PACKAGES=$(echo $ESSENTIAL_PACKAGES | sed 's/,/ /g')

pacstrap /mnt $FORMATED_ESSENTIAL_PACKAGES

# generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# arch-chroot
arch-chroot /mnt

###############################################################
## All commands bellow will be runned in the chrooted system ##
###############################################################

# set timezone
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

# configure hardware clock
hwclock --systohc

# generate /etc/locale.gen
echo $LANG >> /etc/locale.gen
locale-gen

# create /etc/locale.conf
FORMATTED_LANG=$(awk '{print $1}')
echo "LANG=$FORMATTED_LANG" >> /etc/locale.conf

# create /etc/vconsole.conf
echo "KEYMAP=$KEYMAP" >> /etc/vconsole.conf

# set hostname
hostnamectl set-hostname $HOSTNAME

# creating a new initramfs
mkinitcpio -P

# set root password
print_message "Please set a new password to root user"
passwd

# install grub
pacman -S grub
grub-install --target=i386-pc $disk_option
grub-mkconfig -o /boot/grub/grub.cfg