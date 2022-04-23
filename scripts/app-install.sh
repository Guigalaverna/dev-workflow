#!/usr/bin/env bash

# colors
BLUE='\033[1;36m'
NC='\033[0m'

# vars
YAY_ARGS="--noanswerclean --noanswerdiff --noansweredit --noanswerupgrade"

clear
echo -e "Starting ${BLUE}installation process${NC}..."
sleep 3
echo ""

echo -e "${BLUE}==>${NC} Installing ${BLUE}yay${NC}"
cd ~
sudo pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

echo -e "${BLUE}==>${NC} Installing ${BLUE}Discord${NC}"
sudo yay discord_arch_electron $YAY_ARGS

echo -e "${BLUE}==>${NC} Installing ${BLUE}Visual Studio Code${NC}"
sudo yay visual-studio-code-bin  $YAY_ARGS

echo -e "${BLUE}==>${NC} Installing ${BLUE}ULauncher${NC}"
sudo yay ulauncher $YAY_ARGS

echo -e "${BLUE}==>${NC} Installing ${BLUE}Hyper${NC}"
sudo yay hyper $YAY_ARGS