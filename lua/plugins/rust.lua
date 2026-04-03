vim.pack.add({ Gh('mrcjkb/rustaceanvim') })

local bufnr = vim.api.nvim_get_current_buf()

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    vim.keymap.set(
      "n",
      "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
      function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end,
      { silent = true, buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "<leader>ca",
      function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end,
      { silent = true, buffer = bufnr }
    )
  end,
  group = vim.api.nvim_create_augroup("Rusthover", { clear = true })
})
