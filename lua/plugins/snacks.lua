local M = {}

M.defaults = {
  animate = { enabled = false },
  scroll = { enabled = false },
  words = { enabled = true },
  notifier = { enabled = false },
  bigfile = { enabled = true },
  debug = { enabled = true },
  explorer = { enabled = false, replace_netrw = false },
  input = { enabled = true, backdrop = true },
  lazygit = { enabled = true, },
  quickfile = { enabled = true },
  scope = { enabled = true, blocks = { enabled = true } },
  scratch = { minimal = true },
  indent = {
    enabled = true,
    only_scope = true,
    only_current = true,
    animate = { enabled = false },
    chunk = {
      enabled = true,
      only_current = true,
    },
    scope = {
      enabled = true,
      underline = true,
      only_current = true,
    },
  },

  picker = {
    enabled = true,
    cwd_bonus = true,
    formatters = {},
    icons = { files = { enabled = false } },
    layout = { preview = "main", preset = "ivy", },
  },

  terminal = {
    enabled = true,
    keys = {
      q = 'hide',
      gf = function(self)
        local f = vim.fn.findfile(vim.fn.expand('<cfile>'), '**')
        if f == '' then
          Snacks.notify.warn('No file under cursor')
        else
          self:hide()
          vim.schedule(function()
            vim.cmd('e ' .. f)
          end)
        end
      end,
    },
  },

  zen = {
    toggles = {
      words = false,
      line_number = false,
      diagnostics = false,
      inlay_hints = false,
    },
    center = false,
  },

  dashboard = {
    enabled = false,
  },

  styles = {
    zen = {
      enter = true,
      fixbuf = false,
      minimal = false,
      width = 130,
      height = 0,
      backdrop = { transparent = false, blend = 99 },
      keys = { q = false },
      zindex = 40,
      wo = {
        winhighlight = "NormalFloat:Normal",
      },
      w = {
        snacks_main = true,
      },
     }
  }
}

vim.pack.add({ Gh('folke/snacks.nvim') })

local Snacks = require('snacks')
require('snacks').setup(M.defaults)

vim.api.nvim_create_autocmd('User', {
  callback = function()
    _G.dd = function(...)
      Snacks.debug.inspect(...)
    end
    _G.bt = function()
      Snacks.debug.backtrace()
    end
    if vim.fn.has('nvim-0.11') == 1 then
      vim._print = function(_, ...)
        dd(...)
      end
    else
      vim.print = _G.dd
    end

    Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>ts')
    Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>tw')
    Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>tL')
    Snacks.toggle.diagnostics():map('<leader>td')
    Snacks.toggle.line_number():map('<leader>tl')
    Snacks.toggle.treesitter():map('<leader>tT')
    Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>tb')
    Snacks.toggle.inlay_hints():map('<leader>th')
    Snacks.toggle.indent():map('<leader>tg')
    Snacks.toggle.dim():map('<leader>tD')
    Snacks.toggle.words():map('<leader>tW')
    Snacks.toggle.zen():map('<leader>tz')
    Snacks.toggle.zoom():map('<leader>tZ')
    Snacks.toggle.option('conceallevel',
      { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>tc')
  end,
})

return M
