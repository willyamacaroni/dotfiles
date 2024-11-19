return {
  -- add ruby_ls and sorbet lsp to lspconfig
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "rubocop",
        "typescript-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- rubocop, ruby_ls and sorbet will be automatically installed with mason and loaded with lspconfig
        rubocop = {},
        ruby_ls = {},
        sorbet = {
          root_dir = require("lspconfig.util").find_git_ancestor,
        },
        tsserver = {
          root_dir = require("lspconfig.util").root_pattern("package.json"),
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
          end,
        },
      },
    },
  },
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeys[]
          -- keys = {},
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
        ruby_ls = {},
        sorbet = {},
      },
      setup = {},
    },
  },
}
