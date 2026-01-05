vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})
-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function (info)
--     if vim.treesitter.language.add(vim.bo[info.buf].filetype) then
--       -- syntax highlighting
--       vim.treesitter.start()
--       vim.bo.syntax = 'on'
--       -- indent
--       -- vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
--     end
--   end
-- })
 --[[autocmd("FileType", { -- enable treesitter highlighting and indents
    callback = function(args)
      local filetype = args.match
      local lang = vim.treesitter.language.get_lang(filetype)
      if vim.treesitter.language.add(lang) then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.treesitter.start()
      end
    end
  })]]
