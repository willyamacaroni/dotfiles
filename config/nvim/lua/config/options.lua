-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix clipboard in spin
vim.opt.clipboard = "unnamedplus"
local function get_clipboard()
  if vim.env.SPIN == "1" then
    return {
      name = "pbcopy",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = 1,
    }
  else
    return nil
  end
end
vim.g.clipboard = get_clipboard()
