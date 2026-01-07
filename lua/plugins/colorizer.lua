vim.pack.add({
  -- "https://github.com/catgoose/nvim-colorizer.lua"
  Gh("catgoose/nvim-colorizer.lua"),
})

require("colorizer").setup({
  user_default_options = {
    names = false,
    names_opts = { lowercase = false },
    RRGGBBAA = true,
    RGBA = true,
    RGB = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
  },
})
