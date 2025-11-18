#!/bin/bash

PLAYLIST="$HOME/Downloads/playlist.m3u"
SOCKET="/tmp/mpvsocket"

# Se o MPV não estiver rodando, inicia
if ! pgrep -x mpv >/dev/null; then
    mpv --no-video --input-ipc-server="$SOCKET" "$PLAYLIST" --really-quiet &
    echo "null"
    exit 0
fi

# Se o socket não existir, retorna null
if [ ! -S "$SOCKET" ]; then
    echo "null"
    exit 0
fi

# Comando IPC estável usando socat - UNIX-CONNECT
RESPONSE=$(printf '{ "command": ["get_property", "pause"] }\n' | socat - UNIX-CONNECT:"$SOCKET" 2>/dev/null)

# Se resposta vazia → null
[ -z "$RESPONSE" ] && echo "null" && exit 0

# Extrai true/false
VALUE=$(echo "$RESPONSE" | jq -r '.data')

# Se por algum motivo não veio true/false → null
[ "$VALUE" = "null" ] || [ -z "$VALUE" ] && echo "null" && exit 0

# Retorna true/false
echo "$VALUE"

