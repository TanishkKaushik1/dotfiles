#!/bin/bash

rofi -dmenu \
  -i \
  -p "󰌌 Keybinds" \
  -theme-str 'window { width: 600px; } listview { lines: 20; }' \
  < ~/.config/hypr/cheatsheet.txt
