#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME"
FILE=".tmux.conf"

mkdir -p $DEST
ln -sf "$DIR/$FILE" "$DEST/$FILE"

