# load configs
source './config/colors.conf'
source './config/functions.sh'

print_step 01 Starting check

echo ""

# check wifi
ping -c1 google.com 1> /dev/null 2> /dev/null # use ping to check

if [ $? -eq 0 ]; then 
    print_check Network "Have connection"
else
    echo ""
    print_error "No internet connection available"
    exit
fi

# update system clock
timedatectl set-ntp true