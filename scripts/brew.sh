#!/bin/bash

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing packages..."
brew install nvm
brew install --cask iterm2
brew install git

echo "Cleaning up..."
brew cleanup
