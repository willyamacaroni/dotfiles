#THEME
os=$(uname -s)
if [ "$os" = "Darwin" ]; then
	ZSH_THEME="dracula"
elif [ "$os" = "Linux" ]; then
	ZSH_THEME="pixegami-agnoster"
else
	echo "Oh-my-zsh config| couldnt set theme | Unsupported operating system: $os"
fi

source ~/.oh-my-zsh/oh-my-zsh.sh
