vim.pack.add({
	Gh("mikavilpas/yazi.nvim"),
	Gh("nvim-lua/plenary.nvim"),
})

-- vim.keymap.set("n", "<leader>-", function()
--   require("yazi").yazi()
-- end)

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("yazi").setup({
			open_for_directories = true,
		})
	end,
})
