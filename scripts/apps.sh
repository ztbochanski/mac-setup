#!/bin/bash

# Set error handling
set -e

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check if a command exists
check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} $1 installed successfully"
        return 0
    else
        echo -e "${RED}✗${NC} $1 installation failed"
        return 1
    fi
}

# Function to test Docker
test_docker() {
    if docker info >/dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} Docker daemon is running and accessible"
        return 0
    else
        echo -e "${RED}✗${NC} Docker daemon is not running"
        return 1
    fi
}

echo "Installing command line tools and packages..."

# Version Control
brew install git
check_command "git"

# Development Tools
brew install nvm

# You should create NVM's working directory if it doesn't exist:
if [ ! -d "$HOME/.nvm" ]; then
    mkdir ~/.nvm
fi

# Add the following to your shell profile e.g. ~/.profile or ~/.zshrc:
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  
# NVM needs special check as it's not directly in PATH
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    echo -e "${GREEN}✓${NC} nvm installed successfully"
else
    echo -e "${RED}✗${NC} nvm installation failed"
    exit 1
fi

# Shell Tools
brew install tree
check_command "tree"
brew install wget
check_command "wget"

echo "Installing GUI Applications..."

# Terminal
brew install --cask iterm2
[ -d "/Applications/iTerm.app" ] && echo -e "${GREEN}✓${NC} iTerm installed" || echo -e "${RED}✗${NC} iTerm installation failed"

# Browsers
brew install --cask google-chrome
[ -d "/Applications/Google Chrome.app" ] && echo -e "${GREEN}✓${NC} Google Chrome installed" || echo -e "${RED}✗${NC} Google Chrome installation failed"

brew install --cask brave-browser
[ -d "/Applications/Brave Browser.app" ] && echo -e "${GREEN}✓${NC} Brave Browser installed" || echo -e "${RED}✗${NC} Brave Browser installation failed"

# Communication
brew install --cask discord
[ -d "/Applications/Discord.app" ] && echo -e "${GREEN}✓${NC} Discord installed" || echo -e "${RED}✗${NC} Discord installation failed"

# Entertainment
brew install --cask spotify
[ -d "/Applications/Spotify.app" ] && echo -e "${GREEN}✓${NC} Spotify installed" || echo -e "${RED}✗${NC} Spotify installation failed"

# Development Tools
brew install --cask cursor
[ -d "/Applications/Cursor.app" ] && echo -e "${GREEN}✓${NC} Cursor installed" || echo -e "${RED}✗${NC} Cursor installation failed"

brew install --cask visual-studio-code
[ -d "/Applications/Visual Studio Code.app" ] && echo -e "${GREEN}✓${NC} VS Code installed" || echo -e "${RED}✗${NC} VS Code installation failed"

brew install --cask docker
echo "Installing Docker Desktop..."
sleep 3  # Give installer time to finish

# Final verification
echo -e "\nRunning final verification tests..."
echo "----------------------------------------"

# Test core development tools
echo "Testing core development tools:"
check_command "git" || exit 1
[ -f "$HOME/.nvm/nvm.sh" ] || exit 1
check_command "tree" || exit 1
check_command "wget" || exit 1

# Test Docker installation
echo -e "\nTesting Docker installation:"
if [ -d "/Applications/Docker.app" ]; then
    echo -e "${GREEN}✓${NC} Docker Desktop installed"
    echo "NOTE: Please start Docker Desktop from Applications folder and complete first-time setup"
    echo "Then run 'docker info' to verify the installation"
else
    echo -e "${RED}✗${NC} Docker Desktop installation failed"
    exit 1
fi

echo -e "\n${GREEN}Installation completed successfully!${NC}"
echo "----------------------------------------"
echo "Next steps:"
echo "1. Start Docker Desktop from Applications folder"
echo "2. Configure iTerm2 using the provided script"
echo "3. Set up GitHub SSH keys using the github-ssh-setup script"
