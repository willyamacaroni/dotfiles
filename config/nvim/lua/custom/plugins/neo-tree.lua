return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("neo-tree").setup({
      default_component_config = {
        filesystem = {
          follow_current_file = true,
          group_empty_dirs = true,
          hijack_netrw_behavior = "open_default",
        },
      },
    })
  end
}
