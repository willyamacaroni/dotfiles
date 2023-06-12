local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('hoob3rt/lualine.nvim')

Plug('numkil/ag.nvim')

Plug('github/copilot.vim')

Plug('neovim/nvim-lspconfig')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug('nvim-lua/plenary.nvim')

Plug('lewis6991/gitsigns.nvim')

Plug('ethanholz/nvim-lastplace')

Plug('nvim-telescope/telescope.nvim')

-- This doesn't always work. If telescope is erroring do the following
-- cd ~/.config/nvim/plugged/telescope-fzf-native.nvim && make
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

Plug('kyazdani42/nvim-tree.lua')

Plug('tpope/vim-endwise')
Plug('tpope/vim-rails')
Plug('tpope/vim-fugitive')
Plug('tpope/vim')

vim.call('plug#end')
