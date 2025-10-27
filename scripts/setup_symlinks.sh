#!/bin/bash

sudo apt install -y foot i3status neovim fonts-font-awesome

mkdir -p ~/.config
sudo mkdir -p /usr/share/backgrounds

# Diretórios base
DOTFILES_DIR="$HOME/Projects/dotfiles_sway"
CONFIG_DIR="$HOME/.config"

# Pastas de configuração que ficam dentro de ~/.config
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

# Vincular .bashrc
echo "Vinculando .bashrc..."
ln -sf "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"

# Garantir que o papel de parede do Sway seja encontrado
WALLPAPER_SRC="$DOTFILES_DIR/sway/ds.png"
if [ -f "$WALLPAPER_SRC" ]; then
    sudo cp $WALLPAPER_SRC /usr/share/backgrounds/ds.jpg
else
    echo "  Arquivo ds.jpg não encontrado no diretório atual."
    echo "  Coloque o ds.jpg na mesma pasta deste script e execute novamente."
fi

echo "Configurações vinculadas com sucesso."

