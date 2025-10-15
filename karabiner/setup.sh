#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KARABINER_CONFIG_DIR="$HOME/.config/karabiner"

echo "Setting up Karabiner-Elements configuration..."

# Create karabiner config directory if it doesn't exist
if [ ! -d "$KARABINER_CONFIG_DIR" ]; then
    echo "Creating Karabiner-Elements config directory..."
    mkdir -p "$KARABINER_CONFIG_DIR"
fi

# Sync configuration from current system to dotfiles
if [ -f "$KARABINER_CONFIG_DIR/karabiner.json" ]; then
    echo "Copying current karabiner.json to dotfiles..."
    cp "$KARABINER_CONFIG_DIR/karabiner.json" "$SCRIPT_DIR/karabiner.json"
    echo "Configuration backed up to dotfiles"
else
    echo "No existing karabiner.json found"
fi

# Create symbolic link from dotfiles to karabiner config
if [ -f "$SCRIPT_DIR/karabiner.json" ]; then
    echo "Creating symbolic link..."
    # Remove existing file if it exists
    if [ -f "$KARABINER_CONFIG_DIR/karabiner.json" ]; then
        rm "$KARABINER_CONFIG_DIR/karabiner.json"
    fi
    ln -sf "$SCRIPT_DIR/karabiner.json" "$KARABINER_CONFIG_DIR/karabiner.json"
    echo "Karabiner-Elements configuration linked successfully"
else
    echo "No karabiner.json found in dotfiles directory"
fi

echo "Karabiner-Elements setup completed!"