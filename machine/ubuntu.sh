#!/bin/bash

# Install required packages
sudo apt update
sudo apt install curl neovim fzf rcm silversearcher-ag -y

sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y

# install starship
curl -sS https://starship.rs/install.sh | sh

# install neovim
$HOME/dotfiles/machine/spin/install_neovim.sh

# Font installation script
FONT_DIR="$HOME/.fonts"
DOTFILES_FONT_DIR="$HOME/dotfiles/fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Copy the font files to the font directory
cp "$DOTFILES_FONT_DIR"/*.otf "$FONT_DIR"

# Update the font cache
fc-cache -f -v

# Run defaults.sh script from dotfiles
bash ~/dotfiles/machine/ubuntu/defaults.sh

