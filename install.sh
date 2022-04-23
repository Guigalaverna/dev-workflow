#!/usr/bin/env bash

sudo chmod +x scripts/*.sh

# colors
BLUE='\033[1;36m'
NC='\033[0m'

clear
echo -e "Welcome to ${BLUE}Arch Linux${NC} Installer!"
echo ""
echo -e "${BLUE}[1]${NC} Install from LiveCD of Arch Linux"
echo -e "${BLUE}[2]${NC} Install apps and setup computer"
echo ""

read -p "Choose one option: " option

if [ option = 1 ]; then
    ./scripts/full-install.sh
else
    ./scripts/app-install.sh
fi