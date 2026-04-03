local M = {}

M.version = "0.1.0"
M.disabled_plugins = {}
M.extras = {}

function M.load_hooks()
  require("config.hooks")
end

function M.load_plugins()
  require("plugins")
end

function M.load_extras()
  for _, extra in ipairs(M.extras) do
    require("extra." .. extra)
  end
end

function M.load_config()
  require("config.options")
  require("config.autocommands")
  require("config.keybinds")
  require("config.lsp")
end

function M.setup(opts)
  opts = opts or {}
  M.disabled_plugins = opts.disabled_plugins or {}
  M.extras = opts.extras or {}

  M.load_hooks()
  M.load_plugins()
  if #M.extras > 0 then
    M.load_extras()
  end
  M.load_config()
end

return M
