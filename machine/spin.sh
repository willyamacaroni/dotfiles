#!/bin/bash

sudo apt-get install -y \
	fzf \
	rcm \
	silversearcher-ag \
	tmux

# install neovim
$HOME/dotfiles/machine/spin/install_neovim.sh

# install starship
# curl -fsSL https://starship.rs/install.sh | sh -s -- -f

# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme
# sudo cp $HOME/dotfiles/zsh/themes/pixegami-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme

# Dracula
ln -s $HOME/dotfiles/zsh/themes/dracula/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme
