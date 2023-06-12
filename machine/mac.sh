#!/bin/bash

# Install expected apps
brew bundle --file=- <<EOF
tap "neovim/neovim"

brew "fzf"
brew "neovim"
brew "rcm"
brew "starship"
brew "the_silver_searcher"
brew "luarocks"
cask "iterm2"
EOF

brew cleanup

# Install preferred font
cp fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf ~/Library/Fonts/

# Setup expected defaults
$HOME/dotfiles/machine/mac/defaults.sh

# runs post-up hook
$HOME/dotfiles/hooks/post-up
