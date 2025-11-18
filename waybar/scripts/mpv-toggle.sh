#!/bin/bash

SOCKET="/tmp/mpvsocket"

# alterna pause
echo '{ "command": ["cycle", "pause"] }' | socat - $SOCKET

