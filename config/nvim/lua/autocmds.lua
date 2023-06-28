local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


autocmd("BufEnter", {
  desc = "Open Neo-Tree on startup with directory",
  group = augroup("neotree_start", { clear = true }),
  callback = function()
    if package.loaded["neo-tree"] then
      vim.api.nvim_del_augroup_by_name "neotree_start"
    else
      local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
      if stats and stats.type == "directory" then
        vim.api.nvim_del_augroup_by_name "neotree_start"
        require "neo-tree"
        --vim.cmd("NeoTreeShowToggle")
        --vim.cmd("wincmd L")
      end
    end
  end,
})
autocmd("TermClose", {
  pattern = "*lazygit",
  desc = "Refresh Neo-Tree git when closing lazygit",
  group = augroup("neotree_git_refresh", { clear = true }),
  callback = function()
    if package.loaded["neo-tree.sources.git_status"] then require("neo-tree.sources.git_status").refresh() end
  end,
})
