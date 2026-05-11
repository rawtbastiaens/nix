#!/usr/bin/env bash
set -euo pipefail

BUILTIN="eDP-1"

detect_external() {
  hyprctl monitors all -j | jq -r '.[] | select(.name != "'"$BUILTIN"'") | .name' | head -n1
}

OPTIONS="Only builtin\nExtend external\nOnly external"
CHOICE=$(echo -e "$OPTIONS" | wofi --dmenu --prompt "Display setup")

EXTERNAL=$(detect_external)

case "$CHOICE" in
  "Only builtin")
    if [ -n "$EXTERNAL" ]; then
      hyprctl keyword monitor "$EXTERNAL, disable"
    fi
    hyprctl keyword monitor "$BUILTIN, preferred, auto, 1"
    ;;
  "Extend external")
    if [ -z "$EXTERNAL" ]; then
      notify-send "No external monitor detected"
      exit 1
    fi
    hyprctl keyword monitor "$BUILTIN, preferred, auto, 1"
    hyprctl keyword monitor "$EXTERNAL, preferred, auto-right, 1"
    ;;
  "Only external")
    if [ -z "$EXTERNAL" ]; then
      notify-send "No external monitor detected"
      exit 1
    fi
    hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1"
    hyprctl keyword monitor "$BUILTIN, disable"
    ;;
  *)
    exit 1
    ;;
esac

# reload config after swap
hyprctl reload
