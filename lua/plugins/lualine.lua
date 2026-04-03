local M = {}

local custom_onedark = require("lualine.themes.onedark")
custom_onedark.normal.c.bg = "#282C34"

M.defaults = {
  options = {
    icons_enabled = true,
    theme = custom_onedark,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    ignore_focus = { "undotree" },
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = true,
  },

  extensions = { 'nvim-tree', 'man', 'mason', 'quickfix' },
  tabline = {
    lualine_b = {'buffers'},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "project", format = 'short', no_project = nil, } },
    lualine_c = {
      "branch",
      {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = "#98C379" },
          modified = { fg = "#D19A66" },
          removed = { fg = "#E06C75" },
        },
      },
      "filename",
    },
    lualine_x = {
      "searchcount",
      "lsp_status",
      "diagnostics",
      "filetype",
    },
    lualine_y = {},
    lualine_z = {},
  },
}

vim.pack.add({ Gh("nvim-lualine/lualine.nvim") })

require("lualine").setup(M.defaults)

return M
