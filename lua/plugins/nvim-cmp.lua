vim.pack.add({
  Gh('hrsh7th/nvim-cmp'),
  Gh('rafamadriz/friendly-snippets'),
  --Gh('luasnip.loaders.from_vscode'),
  { src = 'https://github.com/L3MON4D3/LuaSnip', },
  Gh('saadparwaiz1/cmp_luasnip'),
  Gh('hrsh7th/cmp-nvim-lsp'),
  Gh('hrsh7th/cmp-path'),
  Gh('hrsh7th/cmp-buffer'),
  Gh('hrsh7th/cmp-cmdline'),
  Gh('hrsh7th/cmp-vsnip'),
  Gh('hrsh7th/vim-vsnip'),
  -- Gh('echasnovski/mini.snippets'),
  -- Gh('abeldekat/cmp-mini-snippets'),
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "build deps for luasnip",
	group = vim.api.nvim_create_augroup("luasnip-install", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" then
			local ok = pcall(vim.system, "make install_jsregexp")
			if ok then
				vim.notify("build jsregexp", vim.log.levels.INFO)
			else
				vim.notify("failed build", vim.log.levels.WARN)
			end
		end
	end,
})

-- luasnip = require('luasnip')
-- local hooks = function(ev)
--   local name, kind = ev.data.spec.name, ev.data.kind
--   -- Run build script after plugin's code has changed
--   if name == 'luasnip' and (kind == 'install' or kind == 'update') then
--     vim.system({ 'make install_jsregexp' }, { cwd = ev.data.path })
--   end
-- end
-- vim.api.nvim_create_autocmd('PackChanged', { callback = hooks})

-- local luashook = function(ev)
--   -- Use available |event-data|
--   local name, kind = ev.data.spec.name, ev.data.kind
--   -- Run build script after plugin's code has changed
--   if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
--     vim.system({ 'make install_jsregexp' }, { cwd = ev.data.path })
--   end
-- end
-- vim.api.nvim_create_autocmd('PackChanged', { callback = luashook })

local cmp = require 'cmp'

--luasnip.config.setup {}

-- local gen_loader = require("mini.snippets").gen_loader
--   require("mini.snippets").setup({
--     snippets = {
--         gen_loader.from_lang(), -- This includes those defined by friendly-snippets.
--     },
--   })
cmp.setup({
  snippet = {
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- For `mini.snippets` users:
       -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
       -- insert({ body = args.body })
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
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
    --['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  -- formatting = {
  --   format = function(_, vim_item)
  --     local icon, hl = MiniIcons.get("lsp", vim_item.kind)
  --     vim_item.kind = icon .. " " .. vim_item.kind
  --     vim_item.kind_hl_group = hl
  --     return vim_item
  --   end,
  -- },

  experimental = {
    ghost_text = vim.g.ai_cmp and { hl_group = "CmpGhostText" } or false,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.

    --{ name = 'luasnip' }, -- For luasnip users.
    -- { name = "mini.snippets",
    --   options = {
    --     use_minisnippets_match_rule = false,
    --     only_allow_inline_start = false,
    --   }
    -- },
  }, {
    { name = 'path' },
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})
