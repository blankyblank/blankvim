# BlankVim

A Neovim distro using Neovim's built-in `vim.pack` package manager.

## Installation

### 1. Install the template config

```bash
git clone https://github.com/blankyblank/blankvim.git ~/.config/nvim
```

### 2. Start Neovim

The distro installs itself automatically on first run.

## Customizing

Override settings in your `lua/` directory.

For example, to override options, create:

```
~/.config/nvim/lua/config/options.lua
```

### Adding Plugins

Add extra plugins in:

```
~/.config/nvim/lua/plugins/extra.lua
```

```lua
vim.pack.add({
  { src = "https://github.com/you/your-plugin" }
})
```

### Overriding Plugin Config

Each plugin exports its defaults. To override a plugin's settings, create the file yourself and use `vim.tbl_deep_extend`:

```lua
-- ~/.config/nvim/lua/plugins/snacks.lua
local snacks = require('blankvim.plugins.snacks')

require('snacks').setup(vim.tbl_deep_extend('force', snacks.defaults, {
  bigfile = { enabled = false },  -- disable bigfile detection
  notifier = { enabled = true },  -- enable the notifier
}))
```

## Disabling Plugins

```lua
require("blankvim").setup({
  disabled_plugins = { "plugin-name" }
})
```

## Optional Plugins

Some plugins are available but not loaded by default. Enable them in your setup:

```lua
require("blankvim").setup({
  extras = { "dap", "noice", "whichkey" }
})
```

Available extras:

- `dap` - Debugger Adapter Protocol
- `neovim-project` - Project management alternative to project.nvim which this uses by default
- `noice` - Alternative UI for messages/cmdline
- `trouble` - LSP diagnostics list
- `whichkey` - Keybinding hints
- `lf` - File manager plugin for lf users (it was a bit buggy when I tested it on st at least)
- `yazi` - File manager plugin for yazi users
- `ministatus` - Alternative statusline
- `mini` - Additional mini.nvim modules (comment and files)

## Structure

```
lua/
├── blankvim/
│   └── init.lua       -- Main module
├── config/            -- Core configuration
│   ├── options.lua    -- vim.opt settings
│   ├── keybinds.lua  -- Key mappings
│   └── ...
├── plugins/           -- Plugin specs (vim.pack.add)
└── extra/             -- Optional/extras
```
