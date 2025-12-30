#!/bin/bash

CHOICE=$(printf "%s\n" \
  "🟣 Purple" \
  "🌸 Pink" \
  "🍑 Peach" \
  "💜 Lavender" \
  "🔵 Blue" \
  "💙 Sky" \
  "🌊 Cyan" \
  "🟦 Teal" \
  "🌿 Mint" \
  "🟢 Green" \
  "🟡 Yellow" \
  "🟠 Orange" \
  "🔴 Red" \
  "🟤 Mocha" \
  "🌫️ Slate" \
  "🌑 Charcoal" \
  "⚪ White" \
  "⚫ Dark" \
| wofi --show dmenu --width 320 --height 420 --prompt "Accent Color")

[ -z "$CHOICE" ] && exit 0

case "$CHOICE" in
  "🟣 Purple")     COLOR="#cba6f7" ;;
  "🌸 Pink")       COLOR="#f38ba8" ;;
  "🍑 Peach")      COLOR="#fab387" ;;
  "💜 Lavender")   COLOR="#b4befe" ;;
  "🔵 Blue")       COLOR="#89b4fa" ;;
  "💙 Sky")        COLOR="#74c7ec" ;;
  "🌊 Cyan")       COLOR="#89dceb" ;;
  "🟦 Teal")       COLOR="#94e2d5" ;;
  "🌿 Mint")       COLOR="#a6e3a1" ;;
  "🟢 Green")      COLOR="#8bd5a6" ;;
  "🟡 Yellow")     COLOR="#f9e2af" ;;
  "🟠 Orange")     COLOR="#fab387" ;;
  "🔴 Red")        COLOR="#f38ba8" ;;
  "🟤 Mocha")      COLOR="#c2a38a" ;;
  "🌫️ Slate")     COLOR="#7f849c" ;;
  "🌑 Charcoal")   COLOR="#45475a" ;;
  "⚪ White")      COLOR="#ffffff" ;;
  "⚫ Dark")       COLOR="#1e1e2e" ;;
  *) exit 0 ;;
esac

# Update Waybar accent
cat > "$HOME/.config/waybar/colors.css" <<EOF
@define-color accent_color $COLOR;
EOF

# Sync Wofi highlight
sed -i "s|ACCENT_COLOR|rgba(${COLOR:1:2}, ${COLOR:3:2}, ${COLOR:5:2}, 0.25)|g" \
  "$HOME/.config/wofi/style.css"

pkill waybar
waybar &
