#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)
FILE=".vimrc"

ln -sf "$DIR/$FILE" "$HOME/$FILE"

