#!/usr/bin/env bash

# Text Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
  echo -e "${GREEN}[SETUP]${NC} $1"
}

warn() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

install_pacman_pkg() {
  for pkg in "$@"; do
    if pacman -Qi "$pkg" &>/dev/null; then
      log "$pkg is already installed, skipping..."
    else
      log "Installing $pkg..."
      sudo pacman -S --noconfirm "$pkg"
    fi
  done
}

install_aur_pkg() {
  for pkg in "$@"; do
    if pacman -Qi "$pkg" &>/dev/null || yay -Qi "$pkg" &>/dev/null; then
      log "AUR package $pkg is already installed, skipping..."
    else
      log "Installing AUR package $pkg..."
      yay -S --noconfirm "$pkg"
    fi
  done
}

# --------------------------
# Core Packages
# --------------------------
core_pkgs=(
  base-devel git neovim tmux zsh ripgrep fzf unzip wget curl jq
  nano vim tree less
)

log "Installing Core Arch Packages..."
install_pacman_pkg "${core_pkgs[@]}"

# --------------------------
# Hyprland & UI Tools
# --------------------------
ui_pkgs=(
  hyprland dunst waybar wofi kitty xdg-desktop-portal-hyprland
  qt5-wayland qt6-wayland polkit-gnome polkit-kde-agent grim slurp wl-clipboard
  rofi sddm
)

log "Installing Hyprland & UI Tools..."
install_pacman_pkg "${ui_pkgs[@]}"

# --------------------------
# Fonts & Audio
# --------------------------
font_audio_pkgs=(
  ttf-jetbrains-mono-nerd noto-fonts-emoji
  pipewire wireplumber pamixer gst-plugin-pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol
)

log "Installing Fonts & Audio..."
install_pacman_pkg "${font_audio_pkgs[@]}"

# --------------------------
# Utilities & Drivers
# --------------------------
extra_pkgs=(
  starship fastfetch efibootmgr brightnessctl btrfs-progs intel-media-driver intel-ucode intel-undervolt
  iwd smartmontools usbutils uwsm vulkan-intel vulkan-nouveau vulkan-radeon xf86-video-amdgpu xf86-video-ati xf86-video-nouveau
  xorg-server xorg-xinit wireless_tools wpa_supplicant zram-generator
)

log "Installing Extra Utilities & Drivers..."
install_pacman_pkg "${extra_pkgs[@]}"

# --------------------------
# Install Yay (AUR Helper)
# --------------------------
if ! command -v yay &>/dev/null; then
  log "Installing Yay (AUR Helper)..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay || exit
  makepkg -si --noconfirm
  cd - || exit
  rm -rf /tmp/yay
else
  log "Yay is already installed."
fi

# --------------------------
# Install AUR Packages
# --------------------------
aur_pkgs=(
  pokemon-colorscripts-git
  spotify-launcher
)

log "Installing AUR Packages..."
install_aur_pkg "${aur_pkgs[@]}"

log "Setup Complete!"
