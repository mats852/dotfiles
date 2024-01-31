#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.config/i3"
FILE="config"

mkdir -p $DEST
ln -sf "$DIR/$FILE" "$DEST/$FILE"
