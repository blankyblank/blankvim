vim.pack.add({
	-- "https://github.com/folke/snacks.nvim",
	Gh("folke/snacks.nvim"),
})

local Snacks = require("snacks")
require("snacks").setup({
	animate = { enabled = false },
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	debug = { enabled = true },
	explorer = { enabled = true, replace_netrw = false },
	input = { enabled = true, backdrop = true },
	notifier = { enabled = false },
	quickfile = { enabled = true },
	-- scope = { enabled = true, blocks = { enabled = true }, },
	scratch = { minimal = true },
	scroll = { enabled = false },
	statuscolumn = {
		enabled = false,
		left = { "git", "sign" }, -- priority of signs on the left (high to low)
		right = { "", "" }, -- priority of signs on the right (high to low)
		-- right = { "fold", "git" }, -- priority of signs on the right (high to low)
		folds = { open = false, git_hl = false },
		git = { patterns = { "GitSign", "MiniDiffSign" } },
		refresh = 50, -- refresh at most every 50ms
	},
	words = { enabled = false },

	indent = {
		enabled = true,
		only_scope = true,
		animate = { enabled = false },
		scope = {
			enabled = true,
			only_current = true,
		},
	},
	picker = {
		enabled = true,
		cwd_bonus = true,
		formatters = {},
		icons = { files = { enabled = false } },
	},
	terminal = {
		enabled = true,
		keys = {
			q = "hide",
			gf = function(self)
				local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
				if f == "" then
					Snacks.notify.warn("No file under cursor")
				else
					self:hide()
					vim.schedule(function()
						vim.cmd("e " .. f)
					end)
				end
			end,
		},
	},
})
vim.api.nvim_create_autocmd("User", {
	callback = function()
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end
		if vim.fn.has("nvim-0.11") == 1 then -- Override print to use snacks for `:=` command
			vim._print = function(_, ...)
				dd(...)
			end
		else
			vim.print = _G.dd
		end

		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle
			.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
			:map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("<leader>ug")
		Snacks.toggle.dim():map("<leader>uD")
		Snacks.toggle.zen():map("<leader>uz")
		Snacks.toggle.zoom():map("<leader>uZ")
	end,
})
