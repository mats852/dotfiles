#!/bin/bash

projects=(
  bash
  vim
  nvim
)

echo "Symlinking configurations..."

for project in "${projects[@]}"; do

  INSTALL="$(pwd)/$project/link.sh"
  
  if [ ! -f "$INSTALL" ]; then
    printf "%12s ...... error: link.sh missing\n" $project
    continue
  fi

  . "$INSTALL"
  printf "%12s ...... done \n" $project
done


