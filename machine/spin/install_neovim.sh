#!/bin/bash

sudo apt-get remove -y neovim

sudo apt-get install -y \
	python3-pip \
	ripgrep \
	tree \
	fzf \
	tmux

# Fetch App Image for NeoVim
NVIM_VERSION="v0.10.0"
mkdir -p $HOME/dotfiles/tmp
cd /usr/local/src
sudo rm -rf nvim.appimage squashfs-root
sudo wget "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim.appimage"
sudo chmod u+x nvim.appimage
sudo ./nvim.appimage --appimage-extract
sudo rm -f /usr/local/bin/nvim
sudo ln -s $PWD/squashfs-root/usr/bin/nvim /usr/local/bin/nvim

if [[ -n $(command -v python3.9) ]]; then
	python3.9 -m pip install neovim
fi

if [[ -n $(command -v gem) ]]; then
	sudo gem install neovim
fi

if [[ -n $(command -v gem) ]]; then
	npm -g install neovim
fi

if [[ ! -f /usr/local/bin/tree-sitter ]]; then
	mkdir -p $HOME/dotfiles/tmp
	cd $HOME/dotfiles/tmp

	# Install Tree-Sitter
	TS_VERSION="v0.20.6"
	wget "https://github.com/tree-sitter/tree-sitter/releases/download/${TS_VERSION}/tree-sitter-linux-x64.gz"
	gunzip tree-sitter-linux-x64.gz
	chmod u+x tree-sitter-linux-x64
	sudo mv tree-sitter-linux-x64 /usr/local/bin/tree-sitter
fi

cd $HOME/dotfiles
rm -rf $HOME/dotfiles/tmp
