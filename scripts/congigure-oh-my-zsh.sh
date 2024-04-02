#!/bin/bash

echo "Configuring Oh My Zsh plugins..."

# Define the plugins you want to enable
PLUGINS="plugins=(git node npm nvm github zsh-syntax-highlighting)"

# Use sed to replace the plugins line in .zshrc. This will add/replace the plugins line.
sed -i'.temp' "/^plugins=/c\\$PLUGINS" $HOME/.zshrc

# Remove the temporary file created by sed
rm $HOME/.zshrc.temp

echo "Oh My Zsh plugins configured."
