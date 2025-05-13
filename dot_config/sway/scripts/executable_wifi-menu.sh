#!/usr/bin/env bash

# wifi-menu.sh - A rofi-based network menu using iwmenu
# Uses Catppuccin Mauve accent color

# Check if iwmenu is installed
if ! command -v iwmenu &> /dev/null; then
    echo "iwmenu is not installed. Please install it first."
    echo "Visit: https://github.com/e-tho/iwmenu for installation instructions."
    exit 1
fi

# Use rofi as the launcher for iwmenu with the Catppuccin theme
iwmenu --launcher rofi \
    --launcher-command "rofi -dmenu -show-icons -theme-str 'window { border-color: #cba6f7; } element.selected.normal { background-color: #cba6f7; text-color: #1e1e2e; }'" \
    --icon xdg

# Exit status
exit $?
