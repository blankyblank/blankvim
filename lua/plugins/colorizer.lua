local M = {}

M.defaults = {
  user_commands = true,
  options = {
    parsers = {
      css = true,
      css_fn = true,
      names = {
        enable = false,
        lowercase = false,
        camelcase = false,
      },
      hex = {
        default = false,
        rgb = true,
        rgba = true,
        rrggbb = true,
        rrggbbaa = true,
        aarrggbb = true,
      },
      rgb = { enable = true, },
      hsl = { enable = true, },
    },
  },
}

vim.pack.add({ Gh("catgoose/nvim-colorizer.lua") })

require("colorizer").setup(M.defaults)

return M
