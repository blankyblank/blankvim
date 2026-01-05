vim.cmd([[
colorscheme onedark
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
]])
local highlight = { "CursorLine", "Whitespace", }

autocmd = vim.api.nvim_create_autocmd
vim.have_nerd_font = true
vim.opt.termguicolors = true

require("plugins")
require("config")
