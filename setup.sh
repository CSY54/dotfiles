#!/bin/bash

# remove below line if you want to setup
exit

# echo command before execute
# set -x

YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

if ! [ -x "$(command -v curl)" ]; then
  printf "${YELLOW}curl command not found, installing...\nThis might require root permissions\n${NC}"

  if [ -x "$(command -v brew)" ]; then
    // macOS
    brew install curl
  elif [ -x "$(command -v apt)" ]; then
    // Ubuntu
    sudo apt install curl
  elif [ -x "$(command -v dnf)" ]; then
    // Fedora
    sudo dnf install curl
  else
    printf "${RED}Unknown os, exiting...${NC}"
    exit
  fi
fi

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

# setup antigen
printf "${YELLOW}Setting up antigen for zsh package managing\n${NC}"
curl -L git.io/antigen > ~/antigen.zsh

# build link
printf "${YELLOW}Building link to dotfiles${NC}\n"
ln -fs ~/.zshrc .zshrc
ln -fs ~/.mytheme.sh .mytheme.sh
ln -fs ~/.vimrc .vimrc

# Yay!
printf "${YELLOW}Finished\nPlease open a new session\n${NC}"

