vim.pack.add({ Gh("folke/which-key.nvim") })

require("which-key").setup({
  preset = "classic",
  triggers = {
    { "<leader>", mode = { "n", "v" } },
    { "\\",       mode = { "n", "v" } },
    { "<C-w>",    mode = { "n", "v" } },
    { "z",        mode = { "n", "v" } },
    { "g",        mode = { "n", "v" } },
  },
  icons = {
    breadcrumb = "+",
    separator = ":",
    group = "+",
    mappings = false,
    colors = true,
    keys = { BS = "bkspace =", Esc = "esc =" },
  },
  win = {
    -- border = "none",
    -- width = 70,
    -- height = { min = 4, max = 25 },
    no_overlap = false,
    -- border = "single",
    padding = { 1, 0 },
    wo = { winblend = 0 },
  },
  layout = {
    spacing = 16,
    width = { min = 4 },
  },
  keys = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
  show_help = false,
  show_keys = false,
  plugins = {
    spelling = { enabled = true },
    presets = {
      operators = true,
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
})

vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = '#21242c' })
vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = '#C678DD' })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = '#61AFEF' })
vim.api.nvim_set_hl(0, "WhichKey", { fg = '#98C379' })

require('which-key').add({
  { "<leader>b", group = "buffer" },
  { "<leader>c", group = "code" },
  { "<leader>d", group = "diagnostics" },
  { "<leader>f", group = "file" },
  { "<leader>g", group = "git" },
  { "<leader>h", group = "help", icon = "󰋖" },
  { "<leader>m", group = "manage", icon = "" },
  { "<leader>o", group = "open", icon = "" },
  { "<leader>p", group = "projects" },
  { "<leader>s", group = "search" },
  { "<leader>t", group = "toggle" },
  { '<leader>w', ":w<CR>", desc = 'write', icon = "" },
  { '<leader>q', ":quit<CR>", desc = 'quit' },
  { '<leader>z', ":wq<CR>", desc = 'write and quit' },
  { "<leader><space>", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Smart Find Files" }
-- })
