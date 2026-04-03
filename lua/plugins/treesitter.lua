vim.pack.add({
  {
    src = Gh('nvim-treesitter/nvim-treesitter'),
    version = 'main',
  },
  {
    src = Gh('nvim-treesitter/nvim-treesitter-textobjects'),
    version = 'main',
    --https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
})


require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(event)
    local ft = event.match
    local lang = vim.treesitter.language.get_lang(ft) or ft
    local buf = event.buf

    -- Auto-install missing parsers asynchronously
    if not vim.treesitter.language.add(lang) then
      local available = vim.g.ts_available or require('nvim-treesitter').get_available()
      if not vim.g.ts_available then vim.g.ts_available = available end
      if vim.tbl_contains(available, lang) then
        require('nvim-treesitter').install({ lang })
      end
    end

    -- Start tree-sitter once the language is added
    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(buf, lang)
      
      -- Enable indentation if the language supports it
      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end
  end,
})

require('nvim-treesitter-textobjects').setup({
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V',  -- linewise
      ['@class.outer'] = '<c-v>', -- blockwise
    },
    include_surrounding_whitespace = true,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
})
-- SELECT keymaps
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

-- MOVE keymaps
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
  -- build a human-readable desc
  local qstr = (type(query) == 'table') and table.concat(query, ',') or query
  vim.keymap.set(modes, lhs, function()
    fn(query, 'textobjects')
  end, { desc = 'Move to ' .. qstr })
end

-- NOTE:
--      uncomment if you want to enable folding
--      with tree-sitter

-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function()
--     -- Enable syntax highlighting
--     vim.treesitter.start()
--     -- vim.wo.foldmethod = 'expr'
--     -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--   end,
-- })
-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
