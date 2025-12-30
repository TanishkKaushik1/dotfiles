#!/bin/bash

OUT="$HOME/.config/waybar/workspaces.css"

# Controlled HSL-based color generator
# Hue: 260–340 (violet → pink → blue)
# Sat: muted
# Lightness: varies by state
rand_color() {
  hue=$((RANDOM % 80 + 260))   # 260–340
  sat=$((RANDOM % 12 + 18))    # 18–30%
  light=$((RANDOM % 8 + 42))   # 42–50%
  echo "$hue,$sat,$light"
}

echo "/* AUTO-GENERATED – DO NOT EDIT */" > "$OUT"

# Base fallback (very dark neutral)
cat >> "$OUT" <<EOF
#workspaces button {
  background: rgba(18,14,24,0.65);
  box-shadow: inset 0 0 0 1px rgba(255,255,255,0.04);
}
EOF

for i in $(seq 1 10); do
  hsl=$(rand_color)
  h=$(echo "$hsl" | cut -d, -f1)
  s=$(echo "$hsl" | cut -d, -f2)
  l=$(echo "$hsl" | cut -d, -f3)

  cat >> "$OUT" <<EOF

/* Workspace $i */
#workspaces button:nth-child($i).empty {
  background: hsla($h,$s%,$((l-10))%,0.40);
}

#workspaces button:nth-child($i).occupied {
  background: hsla($h,$((s+6))%,$l%,0.55);
  box-shadow: inset 0 0 0 1px hsla($h,$((s+8))%,$((l+4))%,0.35);
}

#workspaces button:nth-child($i).active {
  background: hsla($h,$((s+14))%,$((l+6))%,0.75);
  box-shadow:
    inset 0 0 0 1px hsla($h,$((s+16))%,$((l+10))%,0.45),
    0 0 10px hsla($h,$((s+14))%,$((l+8))%,0.40);
}
EOF
done
