vim.pack.add({ Gh("catgoose/nvim-colorizer.lua") })
-- "https://github.com/catgoose/nvim-colorizer.lua"

require("colorizer").setup({
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
        rgb = true,      -- #RGB
        rgba = true,     -- #RGBA
        rrggbb = true,   -- #RRGGBB
        rrggbbaa = true, -- #RRGGBBAA
        aarrggbb = true, -- 0xAARRGGBB
      },
      rgb = { enable = true, },
      hsl = { enable = true, },
      -- names = false,
      -- names_opts = { lowercase = false },
      -- RRGGBBAA = true,
      -- RGBA = true,
      -- rgb_fn = true,
      -- hsl_fn = true,
    },
  },
})
