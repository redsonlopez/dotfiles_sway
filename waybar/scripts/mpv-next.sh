#!/bin/bash
SOCKET="/tmp/mpvsocket"
echo '{ "command": ["playlist-next"] }' | socat - $SOCKET

