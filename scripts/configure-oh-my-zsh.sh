#!/bin/bash

echo "Configuring Oh My Zsh plugins..."

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Define the plugins you want to enable
PLUGINS="plugins=(git node npm nvm github zsh-syntax-highlighting)"

# Use sed to replace the plugins line in .zshrc. This will add/replace the plugins line.
sed -i '' "s/^plugins=(.*)$/$(echo $PLUGINS | sed 's/\//\\\//g')/" ~/.zshrc
cat ~/.zshrc | grep '^plugins='
source ~/.zshrc

echo "Oh My Zsh plugins configured."
