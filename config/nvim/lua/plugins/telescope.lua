return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  setup = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = { width = 0.99, height = 0.99 },
      },
    }
  }
}
