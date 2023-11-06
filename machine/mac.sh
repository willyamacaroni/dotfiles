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
brew "lolcat"
brew "tmux"
cask "iterm2"
EOF

brew cleanup

pip3 install --user powerline-status
sudo apt install -y fonts-powerline

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install plug-ins (you can git-pull to update them later).
(cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)

# Install theme
sudo cp $HOME/dotfiles/zsh/themes/pixegami-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme

# Dracula
ln -s $HOME/dotfiles/zsh/themes/dracula/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme

# Install neofetch and lolcat
sudo apt install neofetch

# Install preferred font
cp -a fonts/RobotoMono ~/Library/Fonts/
cp fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf ~/Library/Fonts/

# Setup expected defaults
$HOME/dotfiles/machine/mac/defaults.sh
