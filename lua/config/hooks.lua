local M = {}

Gh = function(x)
  return 'https://github.com/' .. x
end

-- NOTE: put hooks in this that need to run early.

-- to install jsregexp for LuaSnip
local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({'make', 'install_jsregexp'}, { cwd = ev.data.path }):wait()
    end
end
vim.api.nvim_create_autocmd('PackChanged', {callback = hooks})

-- handle treesitter updates
local tshook = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
    local ok = pcall(vim.cmd, 'TSUpdate')
    if ok then
      vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
    else
      vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
    end
  end
end
vim.api.nvim_create_autocmd('PackChanged', {callback = tshook })

return M
