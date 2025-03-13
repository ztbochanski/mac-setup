#!/bin/bash

echo "Setting up iTerm2..."

# Create iTerm2 configuration directory if it doesn't exist
mkdir -p "$HOME/.iterm2"

# Download the Snazzy theme for iTerm2
echo "Downloading Snazzy color scheme..."
curl -L https://github.com/sindresorhus/iterm2-snazzy/raw/main/Snazzy.itermcolors -o "$HOME/.iterm2/Snazzy.itermcolors"

# Create a directory for iTerm2 backgrounds
mkdir -p "$HOME/.iterm2/backgrounds"

echo "iTerm2 setup completed!"
echo ""
echo "=== Manual Configuration Steps ==="
echo ""
echo "1. Color Scheme Setup:"
echo "   - Open iTerm2"
echo "   - Go to iTerm2 > Preferences > Profiles > Colors"
echo "   - Click on Color Presets... > Import"
echo "   - Navigate to ~/.iterm2/Snazzy.itermcolors and import it"
echo "   - Select 'Snazzy' from the Color Presets dropdown"
echo ""
echo "2. Background Image Setup:"
echo "   - Place your desired background image in ~/.iterm2/backgrounds/"
echo "   - Go to iTerm2 > Preferences > Profiles > Window"
echo "   - Check 'Background Image'"
echo "   - Click 'Choose...' and select your background image"
echo "   - Adjust the background image settings:"
echo "     * Style: Stretch to Fill"
echo "     * Blur: 15-30 (adjust to preference)"
echo "     * Opacity: 85-95% (adjust to preference)"
echo ""
echo "3. Font Setup (Optional):"
echo "   - Go to iTerm2 > Preferences > Profiles > Text"
echo "   - Click 'Change Font'"
echo "   - Recommended: Select a Nerd Font for best experience with Oh My Zsh"
echo ""
echo "4. Window Setup (Optional):"
echo "   - Go to iTerm2 > Preferences > Profiles > Window"
echo "   - Transparency: 15-25% (adjust to preference)"
echo "   - Style: Full-Width Top of Screen"
echo ""
echo "Configuration files are saved in: ~/.iterm2/"
