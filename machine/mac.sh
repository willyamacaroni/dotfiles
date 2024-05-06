#!/bin/bash

# install brew
if ! command -v brew &>/dev/null; then
	echo "Homebrew not installed. Installing now."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	(
		echo
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
	) >>/Users/willyamarcand/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install expected apps
brew bundle --file=- <<EOF
tap "neovim/neovim"

brew "openjdk"
brew "jenv"
brew "fzf"
brew "neovim"
brew "rcm"
brew "starship"
brew "the_silver_searcher"
brew "luarocks"
brew "lolcat"
brew "tmux"
cask "iterm2"
cask "rectangle"
EOF

brew cleanup

export JAVA_HOME=$(/usr/libexec/java_home)
echo "export JAVA_HOME=$(/usr/libexec/java_home)" >>~/.zshrc

echo 'export PATH="$HOME/.jenv/bin:$PATH"' >>~/.zshrc
echo 'eval "$(jenv init -)"' >>~/.zshrc
#
# add the installed Java to jenv
jenv add $(/usr/libexec/java_home)

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
