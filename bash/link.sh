#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
DEST="$HOME/.config"
FILE="boot.sh"

mkdir -p $DEST
[ ! -f "$DEST/$FILE" ] && cp "$DIR/$FILE" "$DEST/$FILE"
