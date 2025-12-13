#!/usr/bin/env bash

# Text Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=======================================${NC}"
echo -e "${BLUE}     DOTFILES SETUP BOOTSTRAPPER      ${NC}"
echo -e "${BLUE}=======================================${NC}"
echo ""

# 0. Initialize Submodules (in case nvim etc are separate repos)
echo -e "${BLUE}[BOOTSTRAP]${NC} Initializing git submodules..."
git submodule update --init --recursive
echo ""

# 1. Ask to install packages
read -p "Do you want to install System Packages (Arch/Hyprland)? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./install_packages.sh
fi

# 2. Ask to deploy configs
read -p "Do you want to DEPLOY configs (Wipe ~/.config & Copy from here)? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./run
fi

echo ""
echo -e "${GREEN}All systems go! Please reboot your machine or reload your shell.${NC}"
