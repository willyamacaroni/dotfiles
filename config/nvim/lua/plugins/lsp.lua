return {
  -- Mason setup (if needed)
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Add any tools you need here
      })
    end,
  },
  -- Consolidated LSP configurations
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Initialize the servers table if it's nil
      opts.servers = opts.servers or {}

      -- Merge your server configurations
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        -- Add Ruby LSPs
        rubocop = {},
        ruby_lsp = {},
        sorbet = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("sorbet/config")(fname) or util.find_git_ancestor(fname)
          end,
        },
        -- Add Python LSP
        pyright = {},
        -- Add JavaScript/TypeScript LSPs
        eslint = {},
        -- Add JSON LSP
        jsonls = {},
        -- Add Lua LSP with settings
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        -- Add any other servers you need
      })

      -- Any additional setup can go here
      opts.setup = opts.setup or {}
    end,
  },
}
