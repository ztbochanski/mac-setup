#!/bin/bash

SCRIPT_DIR="./scripts"

echo "Starting laptop setup..."

# Make sure all scripts are executable
echo "Making all scripts executable..."
chmod +x $SCRIPT_DIR/*.sh

# Update macOS and install Xcode Command Line Tools
echo "Updating macOS and installing Xcode Command Line Tools..."
# Note: The command line tools might prompt a GUI interface for installation
xcode-select --install

# Install Homebrew and packages
echo "Installing Homebrew and essential packages..."
$SCRIPT_DIR/brew.sh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
$SCRIPT_DIR/oh-my-zsh.sh

# Configure Oh My Zsh with plugins
echo "Configuring Oh My Zsh..."
$SCRIPT_DIR/configure-oh-my-zsh.sh

# Install applications
echo "Installing applications..."
$SCRIPT_DIR/apps.sh

# Setup iTerm2 and download Snazzy theme
echo "Setting up iTerm2 Snazzy theme..."
$SCRIPT_DIR/iterm2.sh

echo "Github ssh setup..."
$SCRIPT_DIR/github-ssh-setup.sh

echo "Setup complete!"
echo "Please follow any manual instructions provided by the scripts."
