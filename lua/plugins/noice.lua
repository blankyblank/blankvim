vim.pack.add({
  Gh('folke/noice.nvim'),
  Gh('MunifTanjim/nui.nvim'),
})

require('noice').setup({
  presets = {
    -- command_palette = false,
    bottom_search = true,         -- use a classic bottom cmdline for search
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },

  messages = {
    view = 'mini',
  },
  popupmenu = { enabled = false },
  notify = { enabled = false },

  cmdline = {
    view = 'cmdline',
    format = {
      cmdline = false,
      search_down = false,
      search_up = false,
      filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
      lua = false,
      help = false,
      -- input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
    },
  },
  redirect = {
    view = 'split',
    filter = { event = 'msg_show' },
  },
  routes = {
    { filter = { event = 'msg_showmode' },                                     view = 'mini' },
    { filter = { event = 'msg_show', any = { { find = 'lines yanked' } } },    view = 'mini' },
    { filter = { event = 'msg_show', any = { { find = 'more lines' } } },      view = 'mini' },
    { filter = { event = 'msg_show', any = { { find = 'fewer lines' } } },     view = 'mini' },
    { filter = { event = 'msg_show', any = { { find = 'lines to indent' } } }, opts = { skip = true } },
    { filter = { event = 'msg_show', any = { { find = 'lines indented' } } },  view = 'mini' },
    { filter = { event = 'msg_show', any = { { find = 'lines >ed' } } },       opts = { skip = true } },
    { filter = { event = 'msg_show', any = { { find = 'lines <ed' } } },       opts = { skip = true } },
    { filter = { event = 'msg_show', kind = 'confirm' },                       opts = { skip = true } },
  },

  lsp = {
    progress = { enabled = false },
    messages = { view = 'mini' },
    signature = { enabled = false },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
      ['vim.lsp.util.stylize_markdown'] = false,
      ['cmp.entry.get_documentation'] = false, -- requires hrsh7th/nvim-cmp
    },
  },
})
