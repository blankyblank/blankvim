local M = {}

M.defaults = {
  enable_autochdir = true,
  snacks = {
    enabled = true,
    enable_autochdir = true,
  }
}

vim.pack.add({ Gh('DrKJeff16/project.nvim') })

require('project').setup(M.defaults)

return M
