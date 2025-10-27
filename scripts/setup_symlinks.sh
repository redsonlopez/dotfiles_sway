#!/bin/bash

# Diretórios base
DOTFILES_DIR="$HOME/Projects/dotfiles_sway"
CONFIG_DIR="$HOME/.config"

# Pastas de configuração que ficam dentro de ~/.config
declare -a CONFIGS=("sway" "foot" "i3status")

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
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

# Garantir que o papel de parede do Sway seja encontrado
WALLPAPER_SRC="$DOTFILES_DIR/sway/ds.png"
if [ -f "$WALLPAPER_SRC" ]; then
    echo "Papel de parede encontrado: $WALLPAPER_SRC"
else
    echo "Aviso: o arquivo ds.png não foi encontrado em sway/. Verifique o caminho."
fi

echo "Configurações vinculadas com sucesso."

