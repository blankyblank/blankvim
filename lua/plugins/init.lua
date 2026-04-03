Gh = function(x)
  return 'https://github.com/' .. x
end

-- snacks relies on mini
require('plugins.mini')
require('plugins.snacks')
require('plugins.onedark')
require('plugins.nvim-tree')
require('plugins.project')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.colorizer')
require('plugins.todo-comments')
-- cmp relies on clangd_extensions
require('plugins.clangd_extensions')
require('plugins.nvim-lsp')
require('plugins.nvim-cmp')
require('plugins.mason')
require('plugins.conform')
require('plugins.comment')
require('plugins.vim-suda')
require('plugins.rust')
