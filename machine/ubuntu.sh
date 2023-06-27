#!/bin/bash

# Install required packages
sudo apt update
sudo apt install curl neovim fzf rcm silversearcher-ag -y

sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y

curl -sS https://starship.rs/install.sh | sh

# Install JetBrains Mono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -fv

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run defaults.sh script from dotfiles
bash ~/dotfiles/machine/ubuntu/defaults.sh

