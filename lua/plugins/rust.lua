local M = {}

vim.pack.add({ Gh('mrcjkb/rustaceanvim') })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    vim.keymap.set(
      "n",
      "K",
      function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end,
      { silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>ca",
      function()
        vim.cmd.RustLsp('codeAction')
      end,
      { silent = true }
    )
  end,
  group = vim.api.nvim_create_augroup("Rusthover", { clear = true })
})

return M
