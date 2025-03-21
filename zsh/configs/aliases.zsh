bindkey '^K' kill-whole-line

# Neovim socket functions
start_nvim() {
    CURRENT_DIR=$(basename "$PWD")
    SOCKET="/tmp/nvim-${CURRENT_DIR}"
    nvim --listen "$SOCKET"
}
alias vi='start_nvim'

ai() {
    local socket_path="/tmp/nvim-$(basename "$PWD")"
    dev claude -- "my vim/neovim is listening at the socket $socket_path"
}
