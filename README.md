# Mac Laptop Setup

This repository contains scripts to automate the setup of a Mac laptop for development purposes. It installs essential tools, applications, and configurations to get you up and running quickly.

## What Gets Installed

### Command Line Tools & Packages

- Git (Version Control)
- NVM (Node Version Manager)
- Tree (Directory visualization)
- Wget (File downloading)
- PostgreSQL (Latest version)

### Development & Container Tools

- Docker Desktop (Containerization)
- PostgreSQL (Database, runs as a service)
  - Latest stable version from Homebrew
  - Automatically creates a superuser matching your system username
  - Runs on default port 5432

### GUI Applications

- iTerm2 (Terminal)
- Google Chrome (Browser)
- Brave Browser (Privacy-focused browser)
- Discord (Communication)
- Spotify (Music)
- Cursor (Code Editor)
- Visual Studio Code (Code Editor)

## Project Structure

```perl
mac-laptop-setup/
├── scripts/
│   ├── brew.sh                 # Installs and configures Homebrew
│   ├── apps.sh                 # Installs all applications and packages
│   ├── oh-my-zsh.sh           # Installs Oh My Zsh
│   ├── iterm2.sh              # Sets up iTerm2 with Snazzy theme and configs
│   ├── configure-oh-my-zsh.sh # Configures Oh My Zsh with specified plugins
│   └── github-ssh-setup.sh    # Generates an SSH key for GitHub
└── setup.sh                    # Master script that orchestrates the setup
```

## Setup Instructions

### Prerequisites

- Ensure you have administrator access to your Mac.
- You should be logged in with your Apple ID, as some steps may require it.

### **Step 1: Download and Extract the Repository**

Download and extract the repository using curl:

```sh
curl -L https://github.com/ztbochanski/mac-setup/archive/main.zip -o mac-setup.zip
unzip mac-setup.zip
cd mac-setup-main
```

### **Step 2: Run the Setup Script**

Make the master setup script executable and run it:

```sh
chmod +x scripts/setup.sh
./scripts/setup.sh
```

This script will sequentially execute all setup scripts in the scripts directory. It will prompt you for your system password when necessary.

### **Step 3: iTerm2 Configuration**

The iTerm2 setup script will create necessary directories and download themes, but some manual configuration is required:

1. **Color Scheme Setup**

   - Open iTerm2 > Preferences > Profiles > Colors
   - Click on Color Presets... > Import
   - Navigate to `~/.iterm2/Snazzy.itermcolors` and import it
   - Select 'Snazzy' from the Color Presets dropdown

2. **Background Image Setup**

   - Place your desired background image in `~/.iterm2/backgrounds/`
   - Go to iTerm2 > Preferences > Profiles > Window
   - Check 'Background Image'
   - Click 'Choose...' and select your background image
   - Recommended settings:
     - Style: Stretch to Fill
     - Blur: 15-30
     - Opacity: 85-95%

3. **Optional Configurations**
   - Font: Consider installing a Nerd Font for better Oh My Zsh experience
   - Window: Try Full-Width Top of Screen style with 15-25% transparency

### **Step 4: Docker Setup**

After installation:

1. Launch Docker Desktop from your Applications folder
2. Complete the first-time setup and accept the terms
3. Verify installation:
   ```sh
   docker --version
   docker compose version
   ```

### **Step 5: PostgreSQL Setup**

PostgreSQL is automatically configured with:

- Latest stable version from Homebrew
- Default user: Your system username (with superuser privileges)
- Default port: 5432

To verify the installation:

```sh
# Connect to PostgreSQL
psql postgres

# Check version and connection info
SELECT version();
\conninfo
```

### **Step 6: GitHub SSH Setup**

After running the setup script, add your SSH key to GitHub:

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

- Go to GitHub -> Settings -> SSH and GPG keys -> New SSH key
- Paste your key and save it

## Troubleshooting

- If you encounter permission issues, verify that the scripts are executable (`chmod +x scripts/*.sh`).
- Ensure you have internet access throughout the setup process, as the scripts download software from the web.
- If Homebrew installation fails, make sure you have the latest version of macOS Command Line Tools installed.
- If PostgreSQL fails to start, try: `brew services restart postgresql`
- If Docker Desktop fails to start, ensure virtualization is enabled in your system settings.
