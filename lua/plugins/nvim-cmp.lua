vim.pack.add({
  Gh('hrsh7th/nvim-cmp'),
  Gh('rafamadriz/friendly-snippets'),
  Gh('hrsh7th/cmp-nvim-lsp'),
  Gh('hrsh7th/cmp-nvim-lsp-signature-help'),
  Gh('hrsh7th/cmp-path'),
  Gh('hrsh7th/cmp-buffer'),
  Gh('hrsh7th/cmp-cmdline'),
  -- Gh('abeldekat/cmp-mini-snippets'),
  -- less visual noise, not as feature rich
  Gh("L3MON4D3/LuaSnip"),
  Gh("saadparwaiz1/cmp_luasnip"),
})

-- if using luasnip do this set up before cmp
require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

local cmp = require('cmp')
require("luasnip").setup() -- for luasnip

-- local gen_loader = require('mini.snippets').gen_loader     --for mini.snippets
-- require('mini.snippets').setup({
--   snippets = {
--     gen_loader.from_lang(), -- This includes those defined by friendly-snippets.
--   },
-- })

cmp.setup({
  snippet = {
    expand = function(args)
      -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert --for mini.snippet
      -- insert({ body = args.body }) -- Insert at cursor
      require('luasnip').lsp_expand(args.body) -- For `luasnip`
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
    -- ['<C-y>'] = cmp.mapping.confirm { select = true },
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

  -- to use icons in completion popup
  -- formatting = {
  --   format = function(_, vim_item)
  --     local icon, hl = MiniIcons.get("lsp", vim_item.kind)
  --     vim_item.kind = icon .. " " .. vim_item.kind
  --     vim_item.kind_hl_group = hl
  --     return vim_item
  --   end,
  -- },

  experimental = {
    ghost_text = vim.g.ai_cmp and { hl_group = 'CmpGhostText' } or true,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- for luasnip
    -- { name = 'mini.snippets', }, -- for mini.snippet
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'buffer' },
  }),
})

-- -- try fixing mini.snippets leaving behind tabstops when you undo.
-- vim.keymap.set("n", "u", function()
--   vim.cmd("undo")
--   -- Force cleanup of mini.snippets session (if active)
--   if MiniSnippets.session.get() ~= nil then
--     MiniSnippets.session.stop()
--   end
-- end, { desc = "Undo and clean up snippets" })
--
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

