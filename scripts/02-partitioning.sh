# load configs
source './config/colors.conf'
source './config/functions.sh'

echo ""

print_step 02 Starting partitioning process

echo ""

# wait for user select a disk to install
lsblk

echo ""
echo -e "${BOLD_BLUE}[Question]$NC Please type name of disk where system will be installed (example: /dev/sda)"
echo ""
read -p "> " disk_option

echo "SELECTED_DISK=$disk_option" >> ./config/install.conf

# format
mkfs.ext4 $disk_option

# mount partition
mount ${disk_options}1 /mnt