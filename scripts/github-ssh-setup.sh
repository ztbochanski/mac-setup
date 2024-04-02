#!/bin/bash

# Define the email address associated with your GitHub account
EMAIL="your_email@gmail.com"

# Check for existing Ed25519 key before generating a new one
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "Generating a new Ed25519 SSH key for GitHub..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N ""
else
    echo "An Ed25519 SSH key already exists."
fi

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Ensure ssh-add is available before proceeding
if command -v ssh-add &>/dev/null; then
    # Add SSH private key to the ssh-agent
    ssh-add ~/.ssh/id_ed25519

    # Create or modify the SSH config file to automatically use this key for GitHub
    echo "Ensuring SSH config for GitHub is set up..."
    # Avoid duplicate entries
    if ! grep -q "Host github.com" ~/.ssh/config 2>/dev/null; then
        echo "Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
    else
        echo "GitHub host configuration already exists in SSH config."
    fi
else
    echo "ssh-add command not found. Please add your SSH key to the ssh-agent manually."
fi

echo "GitHub SSH setup completed."
echo "Don't forget to add the new SSH public key to your GitHub account."
echo "Public key:"
cat ~/.ssh/id_ed25519.pub
