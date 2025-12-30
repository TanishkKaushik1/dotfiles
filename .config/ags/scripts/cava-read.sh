#!/usr/bin/env bash

FIFO="/tmp/cava.fifo"

# Ensure FIFO exists
[[ -p "$FIFO" ]] || exit 0

# Read continuously, output last line only
while read -r line; do
  echo "$line"
done < "$FIFO"
