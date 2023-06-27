#!/bin/bash

# Install required packages
sudo apt update
sudo apt install curl neovim fzf rcm silversearcher-ag -y

sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y

# curl -sS https://starship.rs/install.sh | sh

# Install Nerd Font


# Font installation script
FONT_DIR="$HOME/.fonts"
DOTFILES_FONT_DIR="$HOME/dotfiles/fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Copy the font files to the font directory
cp "$DOTFILES_FONT_DIR"/*.otf "$FONT_DIR"

# Update the font cache
fc-cache -f -v

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Run defaults.sh script from dotfiles
bash ~/dotfiles/machine/ubuntu/defaults.sh

