local M = {}

M.defaults = {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
}

vim.pack.add({
  Gh('nvim-tree/nvim-tree.lua'),
  Gh('antosha417/nvim-lsp-file-operations'),
  Gh('nvim-lua/plenary.nvim'),
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup(M.defaults)
require("lsp-file-operations").setup()

return M
