vim.pack.add({
  Gh("coffebar/neovim-project"),
  Gh("Shatur/neovim-session-manager"),
  Gh("nvim-lua/plenary.nvim"),
})

local config = require('session_manager.config')
require('session_manager').setup({
  autoload_mode = config.AutoloadMode.Disabled,
})

require("neovim-project").setup {
  projects = { -- define project roots
    "~/dev/*",
  },
  dashboard_mode = true,
  picker = {
    type = "snacks", -- one of "telescope", "fzf-lua", or "snacks"
  }
}
