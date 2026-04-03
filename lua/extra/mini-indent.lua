vim.pack.add({Gh('mini.indentscope')})
-- remember to double check the urls for these mini plugins
require('mini.indentscope').setup({
  draw = {
    delay = 100,
    animation = require('mini.indentscope').gen_animation.none(),
  },
  options = { try_as_border = true },
  symbol = '│',
})

