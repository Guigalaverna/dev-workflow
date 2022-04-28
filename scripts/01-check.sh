# load configs
source './config/colors.conf'
source './config/system.conf'
source './config/functions.sh'

clear # clear term

print_step 01 Starting check

echo ""

# check boot mode
DIR_EFI_VARS="/sys/firmware/efi/efivars"
if [ -d $DIR_EFI_VARS ]; then
    print_message BIOS "Boot mode (UEFI)"
else
    print_error "This script dosen't have support to BIOS mode"
    exit
fi

# check wifi
ping -c1 google.com 1> /dev/null 2> /dev/null # use ping to check

if [ $? -eq 0 ]; then 
    print_message Network "Have connection"
else
    echo ""
    print_error "No internet connection available"
    exit
fi

# update system clock
timedatectl set-ntp true

# check if service status
timedatectl status | grep $TIMEZONE > /dev/null
if [ $? -eq 0 ]; then
    print_message Timezone "The system timezone is correct"
else
    print_error "The timezone set is not correct with in ./config/system.conf"
fi