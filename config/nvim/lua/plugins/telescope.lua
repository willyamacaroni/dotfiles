return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "vertical",
      layout_config = { prompt_position = "bottom", height = 0.95, width = 0.95 },
      sorting_strategy = "descending",
      winblend = 0,
      mappings = {
        i = {
          ["<c-k>"] = actions.preview_scrolling_up,
          ["<c-j>"] = actions.preview_scrolling_down,
        },
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
  end,
}
