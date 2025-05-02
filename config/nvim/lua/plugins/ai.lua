return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "github/copilot.vim",
    },
    opts = function(_, opts)
      local codecompanion = require("codecompanion")
      --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      local default_adapter = os.getenv("SHOPIFY") and "shopify" or "copilot"

      opts.strategies = {
        chat = {
          adapter = default_adapter,
        },
        inline = {
          adapter = default_adapter,
        },
      }
      opts.adapters = {
        shopify = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = os.getenv("OPENAI_API_BASE"),
              api_key = os.getenv("OPENAI_API_KEY"),
            },
            schema = {
              default = "anthropic:claude-3-7-sonnet-20250219",
              model = {
                choices = {
                  ["anthropic:claude-3-7-sonnet-20250219"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,
      }
      opts.log_level = "DEBUG"
      codecompanion.setup(opts)
    end,
  },
}
