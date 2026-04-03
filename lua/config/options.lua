local M = {}
set = vim.o

vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({
  pattern = {
    [".*/kitty/*.conf"] = "bash",
    [".*/tofi/config"] = "config",
    ["*.h"] = "c",
    ['.*/hypr/.*%.conf'] = 'hyprlang',
    [".*/nvimbacks/.*%.conf"] = "hyprlang",
  },
})

--set.statusline = '%f %(%h%w%M%r%) %= %y' -- NOTE: if not using lualine
set.breakindent = true
set.cmdheight = 0
set.completeopt = "menuone,noselect"
set.confirm = true
set.cursorline = true
set.expandtab = true
set.ignorecase = true
set.inccommand = "split"
set.laststatus = 3
set.list = true
set.number = true
set.relativenumber = true
set.scrolloff = 38
set.shiftwidth = 2
set.showcmd = false
set.showmode = false
set.signcolumn = "yes:1"
-- set.signcolumn = "no" -- NOTE: for no sign column
set.smartcase = true
set.smartindent = true
set.spelllang = "en_us"
set.tabstop = 2
set.termguicolors = true
set.timeoutlen = 600
set.undofile = true
set.virtualedit = "block"
set.winborder = "single"
set.wrap = false

vim.cmd([[
  pa! nohlsearch
  pa! termdebug
]])
--  NOTE: add one of these into vim.cmd to load them on startup
--[[
  pa! nvim.undotree
]]
vim.g.termdebugger = "gdb"
return M
