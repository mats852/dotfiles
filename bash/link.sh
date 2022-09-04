#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.config"
FILE="boot.sh"

mkdir -p $DEST
ln -sf "$DIR/$FILE" "$DEST/$FILE"
echo "[ -f ~/.config/boot.sh ] && . \"$HOME/.config/boot.sh\"" >> /$HOME/.profile
