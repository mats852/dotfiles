#!/bin/bash

echo "Symlinking configurations..."

if [ $# -eq 0 ]; then
    echo "Error: No apps specified, e.g tmux nvim"
    exit 1
fi

for project in "$@"; do
  if [ ! -d "$project" ]; then
    printf "%12s ...... error: project \"$project\" missing\n" $project
    continue
  fi

  INSTALL="$(pwd)/$project/link.sh"
  
  if [ ! -f "$INSTALL" ]; then
    printf "%12s ...... error: link.sh missing\n" $project
    continue
  fi

  . "$INSTALL"
  printf "%12s ...... done \n" $project
done


