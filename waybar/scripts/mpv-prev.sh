#!/bin/bash
SOCKET="/tmp/mpvsocket"
echo '{ "command": ["playlist-prev"] }' | socat - $SOCKET

