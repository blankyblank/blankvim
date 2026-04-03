vim.pack.add({ Gh('stevearc/conform.nvim') })
-- 'https://github.com/stevearc/conform.nvim'
--
require('conform').setup({
  formatters_by_ft = {
    lua = { lsp_format = 'first', },
    c = { 'clang-format' },
    sh = { 'shfmt' },
    markdown = { "prettier" },
  },
  formatters = {},
  default_format_opts = {
    lsp_format = 'fallback',
  },
  -- format_on_save = false,

    format_on_save = function(bufnr)
      local ignore_filetypes = { 'sh', 'lua', 'c', 'sql', 'yaml', 'yml' }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match('/node_modules/') then
        return
      end
      return { timeout_ms = 600, lsp_format = 'fallback' }
    end,
})
require('conform').formatters.shfmt = {
  -- inherit = false,
  command = 'shfmt',
  append_args = { '-i', '2', '-s', '-bn' },
  --"-kp", "-mn"
}


-- NOTE: keymaps and commands

vim.keymap.set({ 'n', 'v' }, '<leader>cn', '<cmd>ConformInfo<cr>', { desc = 'Conform Info' })

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format({ async = true }, function(err, did_edit)
    if not err and did_edit then
      vim.notify('Code formatted', vim.log.levels.INFO, { title = 'Conform' })
    end
  end)
end, { desc = 'Format buffer' })


-- INFO: use if you decide to enable autoformat-on-save use these to toggle it

vim.api.nvim_create_user_command('FormatDisable', function(opts)
  if opts.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
  vim.notify('Autoformat disabled' .. (opts.bang and ' (buffer)' or ' (global)'), vim.log.levels.WARN)
end, { desc = 'Disable autoformat-on-save', bang = true })

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
  vim.notify('Autoformat enabled', vim.log.levels.INFO)
end, { desc = 'Re-enable autoformat-on-save' })

local auto_format = true

vim.keymap.set('n', '<leader>tf', function()
  auto_format = not auto_format
  if auto_format then
    vim.cmd('FormatEnable')
  else
    vim.cmd('FormatDisable')
  end
end, { desc = 'Toggle Autoformat' })

-- NOTE: replace the builtin gw format keymap with conforms formatting below

vim.keymap.set("v", "gw", function()
  require("conform").format({ async = true }, function(err)
    if not err then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    end
  end)
end, { desc = 'Format selection' })

vim.keymap.set("n", "gw", function()
  local old_func = vim.go.operatorfunc
  _G.conform_format_func = function()
    local start = vim.api.nvim_buf_get_mark(0, "[")
    local finish = vim.api.nvim_buf_get_mark(0, "]")
    require("conform").format({
      async = true,
      range = {
        start = { start[1] - 1, start[2] },
        ["end"] = { finish[1] - 1, finish[2] },
      },
    })
    vim.go.operatorfunc = old_func
    _G.conform_format_func = nil
  end
  vim.go.operatorfunc = "v:lua._G.conform_format_func"
  vim.api.nvim_feedkeys("g@", "n", false)
end)
