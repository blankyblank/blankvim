local M = {}

vim.pack.add({
  Gh("folke/todo-comments.nvim"),
})

require('todo-comments').setup()

return M
