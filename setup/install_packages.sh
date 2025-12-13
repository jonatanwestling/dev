#!/usr/bin/env bash

# Text Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[SETUP]${NC} $1"
}

log "Installing Core Arch Packages..."
sudo pacman -S --noconfirm \
    base-devel \
    git \
    neovim \
    tmux \
    zsh \
    ripgrep \
    fzf \
    unzip \
    wget \
    curl \
    jq

log "Installing Hyprland & UI Tools..."
sudo pacman -S --noconfirm \
    hyprland \
    dunst \
    waybar \
    wofi \
    kitty \
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt6-wayland \
    polkit-gnome \
    grim \
    slurp \
    wl-clipboard

log "Installing Fonts & Audio..."
sudo pacman -S --noconfirm \
    ttf-jetbrains-mono-nerd \
    noto-fonts-emoji \
    pipewire \
    wireplumber \
    pamixer

# Install Yay (AUR Helper) if not present
if ! command -v yay &> /dev/null; then
    log "Installing Yay (AUR Helper)..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

log "Installation Complete!"
