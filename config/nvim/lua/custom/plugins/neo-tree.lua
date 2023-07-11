return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
  branch = "v2.x",
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    local neotree = require 'neo-tree'
    neotree.setup({
      filesystem = {
        follow_current_file = true,
        group_empty_dirs = true,
        hijack_netrw_behavior = "open_default",
      },
      buffers = {
        follow_current_file = true,
      }
    })
    vim.cmd([[nnoremap <leader>rf :Neotree reveal<cr>]])
  end
}
