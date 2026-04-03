local M = {}

vim.pack.add({
  Gh('hrsh7th/nvim-cmp'),
  Gh('rafamadriz/friendly-snippets'),
  Gh('hrsh7th/cmp-nvim-lsp'),
  Gh('hrsh7th/cmp-nvim-lsp-signature-help'),
  Gh('hrsh7th/cmp-path'),
  Gh('hrsh7th/cmp-buffer'),
  Gh('hrsh7th/cmp-cmdline'),
  Gh("L3MON4D3/LuaSnip"),
  Gh("saadparwaiz1/cmp_luasnip"),
})

require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

local cmp = require('cmp')
require("luasnip").setup()

M.defaults = {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      cmp.resubscribe({ 'TextChangedI', 'TextChangedP' })
      require('cmp.config').set_onetime({ sources = {} })
    end,
  },
  window = {
    completion = {
      scrollbar = false,
      cmp.config.window.bordered(),
    },
    documentation = {
      scrollbar = false,
      cmp.config.window.bordered(),
    },
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.scroll_docs(-4),
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require('clangd_extensions.cmp_scores'),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  experimental = {
    ghost_text = vim.g.ai_cmp and { hl_group = 'CmpGhostText' } or true,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'buffer' },
  }),
}

cmp.setup(M.defaults)

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})

return M
