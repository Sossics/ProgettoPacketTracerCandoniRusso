#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Trascina uno o più file .png su questo script per convertirli in .jpg"
  exit 1
fi

for input in "$@"; do
  if [[ "$input" == *.png ]]; then
    output="${input%.*}.jpg"
    sips -s format jpeg "$input" --out "$output"
    echo "Convertito: $input → $output"
  else
    echo "Ignorato (non PNG): $input"
  fi
done

exit 0
