vim.pack.add({
  Gh('nvim-mini/mini.nvim'),
})

require('mini.comment').setup({ options = { ignore_blank_line = true } })
require('mini.diff').setup()
require('mini.files').setup({ options = { use_as_default_explorer = false } })
require('mini.git').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.jump').setup({ options = { silent = true } })
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup({
  respect_selection_type = true,
  silent = true,
})
require('mini.indentscope').setup({
  draw = {
    delay = 100,
    animation = require('mini.indentscope').gen_animation.none(),
  },
  options = { try_as_border = true },
  symbol = '│',
})
