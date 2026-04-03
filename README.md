# BlankVim

A Neovim distro using Neovim's built-in `vim.pack` package manager.

## Installation

### 1. Install the distro

```bash
# Clone to your Neovim data directory
git clone https://github.com/YOUR_USERNAME/blankvim-distro.git ~/.local/share/nvim/site/pack/blankvim/start/blankvim-distro
```

### 2. Create your user config

Create `~/.config/nvim/init.lua`:

```lua
require("blankvim").setup()
```

That's it. The distro loads automatically from the site/pack path.

## Customizing

Override settings by creating files in your `lua/` directory. Files with the same path as distro files take precedence.

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
- `lf` - File manager
- `neovim-project` - Project management
- `noice` - Alternative UI for messages/cmdline
- `trouble` - LSP diagnostics list
- `whichkey` - Keybinding hints
- `yazi` - File picker
- `ministatus` - Statusline
- `mini` - Additional mini.nvim modules

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
