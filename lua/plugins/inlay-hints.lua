local M = {}

M.defaults = {
  commands = { enable = true },
  autocmd = { enable = false },
}

vim.pack.add({ Gh("MysticalDevil/inlay-hints.nvim") })

require("inlay-hints").setup(M.defaults)

on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint(bufnr, true)
  else
    print("no inlay hints available")
  end
end

return M
