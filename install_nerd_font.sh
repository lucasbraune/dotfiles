#!/bin/bash

# Installs the Meslo nerd font: https://www.nerdfonts.com/font-downloads

FONT_DIR="$HOME/Library/Fonts"
PATTERN="MesloLGLNerdFontMono-*.ttf"
ZIP_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Meslo.zip"
TEMP_DIR=$(mktemp -d)

if ! find "$FONT_DIR" -type f -name "$PATTERN" | grep -q .; then
    curl -sL "$ZIP_URL" -o "$TEMP_DIR/Meslo.zip"
    unzip -qq "$TEMP_DIR/Meslo.zip" -d "$TEMP_DIR"
    find "$TEMP_DIR" -type f -name "$PATTERN" -exec cp {} "$FONT_DIR" \;
    rm -rf "$TEMP_DIR"
    echo "Installation complete!"
else
    echo "Font files already installed."
fi

