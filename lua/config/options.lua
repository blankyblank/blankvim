set = vim.o

vim.diagnostic.config({ virtual_text = true })
vim.filetype.add {
  pattern = {
    ['.*/kitty/*.conf'] = 'bash',
    ['.*/tofi/config'] = 'config',
    ['*.h'] = 'c',
    --    ['.*/hypr/.*%.conf'] = 'hyprlang',
    ['.*/nvimbacks/.*%.conf'] = 'hyprlang',
  },
}

vim.cmd([[
  packadd! nohlsearch
  packadd! nvim.undotree
  packadd! cfilter
  packadd! termdebug
]])
--set.statusline = '%f %(%h%w%M%r%) %= %y'
set.breakindent = true
set.completeopt = 'menuone,noselect'
set.confirm = true
set.cursorline = true
set.expandtab = true
set.formatoptions =  'tcajnw1'
-- set.formatoptions = 'qjl1'
set.ignorecase = true
set.inccommand = 'split'
set.laststatus = 3
set.list = true
set.number = true
set.relativenumber = true
set.scrolloff = 38
set.shiftwidth = 2
set.showcmd = false
set.showmode = false
set.signcolumn = 'number'
set.smartcase = true
set.smartindent = true
set.spelllang = "en_us"
set.tabstop = 2
set.termguicolors = true
set.timeoutlen = 600
set.undofile = true
set.virtualedit = 'block'
set.winborder = 'single'
set.wrap = false
