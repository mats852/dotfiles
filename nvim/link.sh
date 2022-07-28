#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.config"

mkdir -p $DEST
ln -sf "$DIR" "$DEST"
