local M = {}

M.defaults = {
  inlay_hints = {
    inline = true,
  },
  ast = {
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },
    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  },
}

vim.pack.add({ Gh("p00f/clangd_extensions.nvim") })

require("clangd_extensions").setup(M.defaults)

return M
