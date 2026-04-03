vim.pack.add({ Gh("folke/trouble.nvim") })

require('trouble').setup()

vim.keymap.set('n', "<leader>dL", "<cmd>Trouble loclist toggle<cr>", { desc = "(Trouble) Location List", })
vim.keymap.set('n', "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
vim.keymap.set('n', "<leader>dQ", "<cmd>Trouble qflist toggle<cr>", { desc = "(Trouble) Quickfix List", })
vim.keymap.set('n', "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "(Trouble) Symbols", })
