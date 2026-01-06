#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install dependencies
brew install zsh eza

# setting
ln -sf "$SCRIPT_DIR/zshrc" ~/.zshrc

mkdir -p ~/.config/zsh
for f in "$SCRIPT_DIR"/config/*.zsh; do
    ln -sf "$f" ~/.config/zsh/
done
