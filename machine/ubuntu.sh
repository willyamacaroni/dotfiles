#!/bin/bash

# Install required packages
sudo apt update
sudo apt install curl neovim fzf rcm silversearcher-ag -y

sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y

pip3 install --user powerline-status
sudo apt install -y fonts-powerline

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
sudo cp -a "$DOTFILES_FONT_DIR"/. "$FONT_DIR"

# Update the font cache
fc-cache -f -v

# Install ZSH
sudo apt install -y git-core zsh curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme
sudo cp ../zsh/themes/pixegami-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme

# Install plug-ins (you can git-pull to update them later).
(cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)

dconf load /org/gnome/terminal/legacy/profiles:/:fb358fc9-49ea-4252-ad34-1d25c649e633/ <./ubuntu/terminal_profile.dconf

# Add it to the default list in the terminal
add_list_id=fb358fc9-49ea-4252-ad34-1d25c649e633
old_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list | tr -d "]")

if [ -z "$old_list" ]; then
	front_list="["
else
	front_list="$old_list, "
fi

new_list="$front_list'$add_list_id']"
dconf write /org/gnome/terminal/legacy/profiles:/list "$new_list"
dconf write /org/gnome/terminal/legacy/profiles:/default "'$add_list_id'"

# Run defaults.sh script from dotfiles
bash ~/dotfiles/machine/ubuntu/defaults.sh
