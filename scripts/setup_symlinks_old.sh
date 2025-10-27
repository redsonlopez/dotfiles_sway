#!/bin/bash
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/Projects/dotfile_sway"

ln -sf "$DOTFILES_DIR/sway" "$CONFIG_DIR/sway"
ln -sf "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
ln -sf "$DOTFILES_DIR/foot" "$CONFIG_DIR/foot"
ln -sf "$DOTFILES_DIR/i3status-rust" "$CONFIG_DIR/i3status-rust"

