#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

if [[ "$OSTYPE" == "msys" ]]; then
  DEST="$HOME/AppData/Local"
else
  DEST="$HOME/.config"
fi

mkdir -p $DEST

MSYS=winsymlinks:nativestrict ln -sf "$DIR" "$DEST"
