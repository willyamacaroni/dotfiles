-- bootstrap lazy.nvim, LazyVim and your plugins
-- Make it obvious where 120 characters is
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Fix clipboard in spin
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

-- copy filepath and line number
vim.cmd([[
  function! CopyFilePathAndLine()
    let l:file_path = expand('%:~:.') . ':' . line('.')
    let @+=l:file_path
    echo 'Copied to clipboard: ' . l:file_path
  endfunction

]])

require("config.lazy")
