#!/bin/bash

sudo pacman -S foot git mpc mpd neovim nwg-bar tree ttf-nerd-fonts-symbols waybar wl-clipboard wmenu wofi

mkdir -p ~/.config
sudo mkdir -p /usr/share/backgrounds
mkdir -p ~/.local/share/mpd/playlists
mkdir ~/Music
cp ~/Projects/dotfiles_sway/music/* ~/Music
DOTFILES_DIR="$HOME/Projects/dotfiles_sway"
CONFIG_DIR="$HOME/.config"

declare -a CONFIGS=("foot" "mpd" "nvim" "qutebrowser" "sway" "waybar" "wofi")

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

systemctl --user enable --now mpd.service
mpc update
mpc add /
mpc repeat on
