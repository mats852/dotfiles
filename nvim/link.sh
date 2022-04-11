#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.config/nvim"

mkdir -p $DEST
ln -sf "$DIR/init.vim" "$DEST/init.vim"
ln -sf "$DIR/lua" "$DEST/lua"
