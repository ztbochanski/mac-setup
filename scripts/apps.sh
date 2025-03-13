#!/bin/bash

echo "Installing command line tools and packages..."
# Version Control
brew install git

# Development Tools
brew install nvm

# Shell Tools
brew install tree
brew install wget

echo "Installing GUI Applications..."

# Terminal
brew install --cask iterm2

# Browsers
brew install --cask google-chrome
brew install --cask brave-browser

# Communication
brew install --cask discord

# Entertainment
brew install --cask spotify

# Development Tools
brew install --cask cursor
brew install --cask visual-studio-code

echo "All applications installed successfully."
