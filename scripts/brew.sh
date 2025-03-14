#!/bin/bash

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run these commands in your terminal to add Homebrew to your PATH:
echo >> /Users/zachbochanski/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/zachbochanski/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Updating Homebrew..."
brew update

echo "Cleaning up..."
brew cleanup
