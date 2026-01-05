vim.pack.add({
	Gh("MysticalDevil/inlay-hints.nvim"),
})

require("inlay-hints").setup({
	commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
	autocmd = { enable = false }, -- Enable the inlay hints on `LspAttach` event
})

on_attach = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.g.inlay_hints_visible = true
		vim.lsp.inlay_hint(bufnr, true)
	else
		print("no inlay hints available")
	end
end
