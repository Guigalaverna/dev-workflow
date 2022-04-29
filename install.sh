#!/usr/bin/env bash

sudo chmod +x scripts/*.sh

# load configs

SCRIPT_LIST=($(ls -l ./scripts | awk '{print $9}'))

clear # clear term

for script in ${SCRIPT_LIST[@]}; do
    sudo bash ./scripts/$script
done
