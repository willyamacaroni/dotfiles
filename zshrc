# load custom executable functions
#for function in ~/.zsh/functions/*; do
#  source $function
#done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*; do
        . $config
      done
    fi

    for config in "$_dir"/**/*; do
      case "$config" in
        "$_dir"/(pre|post)/*)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*; do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH="$HOME/.bin:$PATH"

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

c(){
  clear
}

fd() {
  local target_branch=""

  # Check if the first argument is a branch name
  target_branch="$1"
  shift # Remove the branch name from the arguments

  # Construct the preview command
  if [ -n "$target_branch" ]; then
    preview="git diff $target_branch --color=always -- {-1}"
    git diff $target_branch --name-only | fzf -m --ansi --preview "$preview"
  else
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview "$preview"
  fi
}

gco() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# [[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

# bun completions
[ -s "/home/wilyuhm/.bun/_bun" ] && source "/home/wilyuhm/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(brew --prefix openjdk)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/willyamarcand/.kube/config:/Users/willyamarcand/.kube/config.shopify.cloudplatform
