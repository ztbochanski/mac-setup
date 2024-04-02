#!/bin/bash

echo "Setting up iTerm2 snazzy theme..."

# Install iTerm2 if not already installed (handled in apps.sh, but included here for completeness)
if ! brew list --cask | grep -q iterm2; then
    echo "Installing iTerm2..."
    brew install --cask iterm2
fi

# Download the Snazzy theme for iTerm2
echo "Downloading Snazzy color scheme for iTerm2..."
curl -L https://github.com/sindresorhus/iterm2-snazzy/raw/main/Snazzy.itermcolors -o "$HOME/Snazzy.itermcolors"

echo "Downloaded Snazzy color scheme to $HOME/Snazzy.itermcolors"
echo "Please manually import this color scheme in iTerm2:"
echo "1. Open iTerm2."
echo "2. Go to iTerm2 > Preferences > Profiles > Colors Tab."
echo "3. Click Color Presets... at the bottom right."
echo "4. Click Import... and select the Snazzy.itermcolors file."
echo "5. After importing, select Snazzy from the Load Presets list."
