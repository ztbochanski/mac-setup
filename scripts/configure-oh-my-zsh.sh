#!/bin/bash

echo "Configuring Oh My Zsh plugins..."

# Define the plugins you want to enable
PLUGINS="plugins=(git node npm nvm github zsh-syntax-highlighting)"

# Use sed to replace the plugins line in .zshrc. This will add/replace the plugins line.
sed -i '' "/^plugins=/c\\$PLUGINS" $HOME/.zshrc

echo "Oh My Zsh plugins configured."
