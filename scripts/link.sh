#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.local"

mkdir -p $DEST
ln -sf "$DIR" "$DEST"
