return {
  cmd = {"/home/blank/.local/share/nvim/mason/bin/lua-language-server"},

  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = { 'lua/?.lua', 'lua/?/init.lua', },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME }
        -- Or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration.
        -- library = { vim.api.nvim_get_runtime_file('', true), }
      }
    })
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "lowercase-global"}
      }
    }
  }
}
