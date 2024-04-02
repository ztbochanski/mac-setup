# Mac Laptop Setup

This repository contains scripts to automate the setup of a Mac laptop for development purposes. It installs essential tools, applications, and configurations to get you up and running quickly.

## Project Structure

```perl
mac-laptop-setup/
├── scripts/
│   ├── brew.sh                 # Installs Homebrew and some command-line tools.
│   ├── oh-my-zsh.sh            # Installs Oh My Zsh.
│   ├── apps.sh                 # Installs essential applications via Homebrew Cask.
│   ├── iterm2.sh               # Download Snazzy theme for iterm2
│   ├── configure-oh-my-zsh.sh  # Configures Oh My Zsh with specified plugins.
│   └── github-ssh-setup.sh     # Generates an SSH key for GitHub and sets up the SSH config.
└── setup.sh                    # Master script that orchestrates the setup process.
```

## Setup Instructions

### Prerequisites

Ensure you have administrator access to your Mac.
You should be logged into your Apple ID, as some steps may require it.

**Step 1: Clone the Repository**
Clone this repository to your local machine:

```sh
git clone https://your-repository-url.git
cd your-repository-directory
```

**Step 2: Run the Setup Script**
Make the master setup script executable and run it:

```sh
Copy code
chmod +x scripts/setup.sh
./scripts/setup.sh
```

This script will sequentially execute all setup scripts in the scripts directory. It will prompt you for your system password when necessary.

**Step 3: Manually Add SSH Key to GitHub**
After running github-ssh-setup.sh through the main script, you'll need to manually add the generated SSH key to your GitHub account:

Copy the SSH key to your clipboard:

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

- Go to GitHub -> Settings -> SSH and GPG keys -> New SSH key, paste your key, and save it.

**Step 4: Manual Configurations**

- iTerm2 Theme: Follow the instructions printed by iterm2.sh to import and select the Snazzy theme in iTerm2.
- Oh My Zsh Plugins: The script configure-oh-my-zsh.sh automatically configures the specified plugins. Ensure they are activated by opening a new terminal window.

## Troubleshooting

- If you encounter permission issues, verify that the scripts are executable (`chmod +x scripts/\*.sh`).
- Ensure you have internet access throughout the setup process, as the scripts download software from the web.
