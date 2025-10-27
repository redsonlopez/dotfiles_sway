#!/bin/bash

sudo apt install -y foot i3status neovim wmenu fonts-font-awesome

sudo apt install brightnessctl
sudo usermod -aG video $USER

sudo apt install pipewire pipewire-audio-client-libraries pipewire-pulse wireplumber
# Deactive pulseaudio
systemctl --user stop pulseaudio.service pulseaudio.socket
systemctl --user disable pulseaudio.service pulseaudio.socket
# Active pipewire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber


mkdir -p ~/.config
sudo mkdir -p /usr/share/backgrounds

DOTFILES_DIR="$HOME/Projects/dotfiles_sway"
CONFIG_DIR="$HOME/.config"

declare -a CONFIGS=("sway" "foot" "i3status" "nvim")

# Criação dos links simbólicos
for dir in "${CONFIGS[@]}"; do
    SRC="$DOTFILES_DIR/$dir"
    DEST="$CONFIG_DIR/$dir"

    if [ -d "$DEST" ] || [ -L "$DEST" ]; then
        echo "Removendo configuração anterior de $dir..."
        rm -rf "$DEST"
    fi

    echo "Criando link para $dir..."
    ln -sf "$SRC" "$DEST"
done

echo "Vinculando .bashrc..."
ln -sf "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"

WALLPAPER_SRC="$DOTFILES_DIR/sway/ds.png"
if [ -f "$WALLPAPER_SRC" ]; then
    sudo cp $WALLPAPER_SRC /usr/share/backgrounds/ds.jpg
else
    echo "  Arquivo ds.jpg não encontrado no diretório atual."
    echo "  Coloque o ds.jpg na mesma pasta deste script e execute novamente."
fi

echo "Configurações vinculadas com sucesso."

