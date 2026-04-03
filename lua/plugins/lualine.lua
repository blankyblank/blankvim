vim.pack.add({ Gh("nvim-lualine/lualine.nvim") })

local custom_onedark = require("lualine.themes.onedark")
custom_onedark.normal.c.bg = "#282C34"

require("lualine").setup({
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
    -- TODO: find highlight group for lualine_a tabline and change
    -- lualine_a = {'buffers'},
    lualine_b = {'buffers'},
  },
  sections = {
    lualine_a = { "mode" },
      -- TODO: might remove, i'll test for a bit
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
      -- NOTE: leaving just in case I add noice back for some reason
      -- {
      --   require("noice").api.status.mode.get,
      --   cond = require("noice").api.status.mode.has,
      --   color = { fg = "#E06C75" },
      -- },
    },
    lualine_y = {},
    lualine_z = {},
  },
})
