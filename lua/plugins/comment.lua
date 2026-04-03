local M = {}

vim.pack.add({
  Gh("numToStr/Comment.nvim")
})

require('Comment').setup()

return M
