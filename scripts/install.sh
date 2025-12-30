#!/bin/bash

set -e

echo "==> Installing dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"

echo "-> Creating config backup..."
mkdir -p ~/.config-backup
cp -r ~/.config ~/.config-backup/config-$(date +%F-%T) || true

echo "-> Linking .config files..."
for dir in "$DOTFILES_DIR/.config/"*; do
  name=$(basename "$dir")
  rm -rf "$HOME/.config/$name"
  ln -s "$dir" "$HOME/.config/$name"
done

echo "-> Linking wallpapers..."
mkdir -p ~/Pictures
rm -rf ~/Pictures/wallpapers
ln -s "$DOTFILES_DIR/wallpapers" ~/Pictures/wallpapers

echo "-> Linking avatars..."
mkdir -p ~/Pictures
rm -rf ~/Pictures/avatars
ln -s "$DOTFILES_DIR/avatars" ~/Pictures/avatars

echo "-> Linking .zshrc..."
rm -f ~/.zshrc
ln -s "$DOTFILES_DIR/.zshrc" ~/.zshrc

echo "✅ Dotfiles installed successfully"
