vim.pack.add({
  Gh('nvim-mini/mini.nvim')
})

require('mini.diff').setup()
require('mini.files').setup{options = {use_as_default_explorer = false}}
require('mini.git').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.jump').setup{options = {silent = true}}
require('mini.move').setup()
require('mini.pairs').setup()

require('mini.comment').setup({
  options = {
    ignore_blank_line = true,
--     start_of_line = true
  }
})
require('mini.surround').setup{
  respect_selection_type = true,
  silent = true,
}

local mystatus =  function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 40 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
  local filename      = MiniStatusline.section_filename({ trunc_width = 1200 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 1200 })
  local location      = MiniStatusline.section_location({ trunc_width = 75 })
  -- local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
  return MiniStatusline.combine_groups({
    { hl = mode_hl,                  strings = { mode } },
    { hl = 'MiniStatuslineDevinfo',  strings = { filename, git, diff } },
    '%<',
    { hl = 'StatusLine', strings = {} },
    '%=',
    { hl = 'MiniStatuslineFileinfo', strings = { diagnostics, lsp, fileinfo } },
    -- { hl = mode_hl,                  strings = { search } },
  })
end
require('mini.statusline').setup({content = { active = mystatus }})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

