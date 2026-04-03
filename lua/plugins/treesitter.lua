local M = {}

M.defaults = {
  install_dir = vim.fn.stdpath('data') .. '/site',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
}

M.textobjects_defaults = {
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v',
      ['@function.outer'] = 'V',
      ['@class.outer'] = '<c-v>',
    },
    include_surrounding_whitespace = true,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
}

vim.pack.add({
  {
    src = Gh('nvim-treesitter/nvim-treesitter'),
    version = 'main',
  },
  {
    src = Gh('nvim-treesitter/nvim-treesitter-textobjects'),
    version = 'main',
  },
})

require('nvim-treesitter').setup(M.defaults)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(event)
    local ft = event.match
    local lang = vim.treesitter.language.get_lang(ft) or ft
    local buf = event.buf

    if not vim.treesitter.language.add(lang) then
      local available = vim.g.ts_available or require('nvim-treesitter').get_available()
      if not vim.g.ts_available then vim.g.ts_available = available end
      if vim.tbl_contains(available, lang) then
        require('nvim-treesitter').install({ lang })
      end
    end

    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(buf, lang)
      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end
  end,
})

require('nvim-treesitter-textobjects').setup(M.textobjects_defaults)

local sel = require('nvim-treesitter-textobjects.select')
for _, map in ipairs({
  { { 'x', 'o' }, 'af', '@function.outer' },
  { { 'x', 'o' }, 'if', '@function.inner' },
  { { 'x', 'o' }, 'ac', '@class.outer' },
  { { 'x', 'o' }, 'ic', '@class.inner' },
  { { 'x', 'o' }, 'aa', '@parameter.outer' },
  { { 'x', 'o' }, 'ia', '@parameter.inner' },
  { { 'x', 'o' }, 'ad', '@comment.outer' },
  { { 'x', 'o' }, 'as', '@statement.outer' },
}) do
  vim.keymap.set(map[1], map[2], function()
    sel.select_textobject(map[3], 'textobjects')
  end, { desc = 'Select ' .. map[3] })
end

local mv = require('nvim-treesitter-textobjects.move')
for _, map in ipairs({
  { { 'n', 'x', 'o' }, ']m', mv.goto_next_start,     '@function.outer' },
  { { 'n', 'x', 'o' }, '[m', mv.goto_previous_start, '@function.outer' },
  { { 'n', 'x', 'o' }, ']]', mv.goto_next_start,     '@class.outer' },
  { { 'n', 'x', 'o' }, '[[', mv.goto_previous_start, '@class.outer' },
  { { 'n', 'x', 'o' }, ']M', mv.goto_next_end,       '@function.outer' },
  { { 'n', 'x', 'o' }, '[M', mv.goto_previous_end,   '@function.outer' },
  { { 'n', 'x', 'o' }, ']o', mv.goto_next_start,     { '@loop.inner', '@loop.outer' } },
  { { 'n', 'x', 'o' }, '[o', mv.goto_previous_start, { '@loop.inner', '@loop.outer' } },
}) do
  local modes, lhs, fn, query = map[1], map[2], map[3], map[4]
  local qstr = (type(query) == 'table') and table.concat(query, ',') or query
  vim.keymap.set(modes, lhs, function()
    fn(query, 'textobjects')
  end, { desc = 'Move to ' .. qstr })
end

return M
