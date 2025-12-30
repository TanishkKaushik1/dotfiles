#!/bin/bash

set -e

echo "==> Installing required programs..."

sudo pacman -S --needed \
  hyprland waybar swaync kitty rofi wlogout \
  wl-clipboard grim slurp hyprshot \
  pipewire wireplumber \
  qt5ct qt6ct \
  starship cava \
  swww waypaper \
  zsh git neovim

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "-> Installing oh-my-zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "-> Setting zsh as default shell..."
chsh -s /bin/zsh

echo "✅ Programs installed"
