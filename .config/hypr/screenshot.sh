#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Region screenshot (force output dir, single save)
hyprshot -m region -o "$DIR"
