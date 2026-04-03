local M = {}

vim.pack.add({
  Gh("olimorris/onedarkpro.nvim"),
})

local color = require('onedarkpro.helpers')

M.colors = {
  float_bg = "#282c34",
  inlay_hint = "#7f848e",
  consts = "#e5c07b",
  ops = "#E6E6E6",
  funcs = "#abb2bf",
  var_ro = color.lighten('yellow', 7, 'onedark'),
}

M.highlights = {
  Comment = { fg = "#7f848e", italic = true },
  Identifier = { fg = "${funcs}" },
  Operator = { fg = "${ops}", bold = true },
  Function = { fg = "${ops}", italic = true },
  ["@function"] = { fg = "${funcs}", italic = true },
  ["@function.declaration.c"] = { fg = "${funcs}", bold = true, italic = true },
  ["@function.builtin.c"] = { fg = "${funcs}", italic = true },
  ["@lsp.typemod.function.defaultLibrary.c"] = { fg = "${funcs}", italic = true },
  ["@character.printf"] = { fg = "#d19a66" },
  ["@constant.c"] = { fg = "${consts}" },
  ["@constant.builtin.c"] = { fg = "${consts}" },
  ["@variable.c"] = { fg = "#e06c75" },
  ["@lsp.type.variable.c"] = { fg = "#e06c75" },
  ["@lsp.typemod.variable.readonly.c"] = { fg = "${var_ro}", bold = true },
  ["@variable.parameter.c"] = { fg = color.lighten('red', 7, 'onedark'), bold = true, italic = true },
  Statement = { fg = "${ops}" },
  ["@lsp.type.operator.c"] = { fg = "${funcs}", bold = true },
  ["@operator"] = { fg = "${funcs}", bold = true},
  ["@punctuation.bracket"] = { fg = "${ops}" },
  ["@Keyword.modifier.c"] = { fg = "${ops}" },
  ["@Keyword.conditional.c"] = { fg = "${ops}" },
  ["@type.builtin.c"] = { fg = "${funcs}" },
  ["@type.qualifier.c"] = { fg = "${funcs}" },
  Keyword = { fg = "${ops}" },
  ["@lsp.type.macro.c"] = { fg = "#d19a66" },
  ["@Keyword.return.c"] = { fg = "#61AFEF" },
  ["@Keyword.import.c"] = { fg = "#61AFEF" },
  ["@label.c"] = { fg = "#61AFEF" },
}

M.defaults = {
  colors = M.colors,
  highlights = M.highlights,
  options = { cursorline = true, terminal_colors = false },
  filetypes = { all = false, },
  plugins = { treesitter = true, },
}

require("onedarkpro").setup(M.defaults)
vim.cmd("colorscheme onedark")

return M
