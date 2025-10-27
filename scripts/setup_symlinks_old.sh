#!/bin/bash
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/Projects/dotfiles_sway"

ln -sf "$DOTFILES_DIR/sway" "$CONFIG_DIR/sway"
ln -sf "$DOTFILES_DIR/foot" "$CONFIG_DIR/foot"
ln -sf "$DOTFILES_DIR/i3status" "$CONFIG_DIR/i3status"

