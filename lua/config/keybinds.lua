vim.g.mapleader = " "
vim.g.maplocalleader = ","

require('which-key').add({
  { "<leader>d", group = "diagnostics" },
  { "<leader>e", group = "explorers" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>l", group = "code" },
  { "<leader>p", group = "plugins" },
  { "<leader>s", group = "sudo" },
  { "<leader>t", group = "tabs" },
  { "<leader>u", group = "toggle" },
})


vim.keymap.set('i', '<M-b>', '<ESC>^i', { desc = 'move to beginning of line' })
vim.keymap.set('n', '<M-b>', '0', { desc = 'move to beginning of line' })
vim.keymap.set({ 'i', 'n' }, '<M-e>', '<End>', { desc = 'move to end of line' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

vim.keymap.set('n', '<C-Left>', '"<Cmd>vertical resize -" . v:count1 . "<CR>"', {
  expr = true,
  replace_keycodes = false,
  desc = 'Decrease window width'
})
vim.keymap.set('n', '<C-Down>', '"<Cmd>resize -"          . v:count1 . "<CR>"', {
  expr = true,
  replace_keycodes = false,
  desc = 'Decrease window height'
})
vim.keymap.set('n', '<C-Up>', '"<Cmd>resize +"          . v:count1 . "<CR>"', {
  expr = true,
  replace_keycodes = false,
  desc = 'Increase window height'
})
vim.keymap.set('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', {
  expr = true,
  replace_keycodes = false,
  desc = 'Increase window width'
})

vim.keymap.set('c', '<M-h>', '<Left>', { silent = false, desc = 'Left' })
vim.keymap.set('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })
vim.keymap.set('i', '<M-h>', '<Left>', { noremap = false, desc = 'Left' })
vim.keymap.set('i', '<M-j>', '<Down>', { noremap = false, desc = 'Down' })
vim.keymap.set('i', '<M-k>', '<Up>', { noremap = false, desc = 'Up' })
vim.keymap.set('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })
vim.keymap.set('t', '<M-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('t', '<M-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('t', '<M-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('t', '<M-l>', '<Right>', { desc = 'Right' })
vim.keymap.set("n", '<Esc>', "<cmd>noh<CR>", { desc = 'quit' })

vim.keymap.set("n", '<leader>q', ":quit<CR>", { desc = 'quit' })
vim.keymap.set("n", '<leader>w', ":w<CR>", { desc = 'write' })
vim.keymap.set("n", '<leader>z', ":wq<CR>", { desc = 'write and quit' })
vim.keymap.set("n", '<leader>pm', ":Mason<CR>", { desc = 'view mason' })
vim.keymap.set("n", '<leader>tn', ":tabnext<CR>", { desc = 'next tab' })
vim.keymap.set("n", '<leader>tp', ":tabprevious<CR>", { desc = 'previous tab' })
vim.keymap.set("n", '<leader>tq', ":tabc<CR>", { desc = 'close tab' })
vim.keymap.set("n", '<leader>sw', ":SudaWrite<CR>", { desc = 'suda write' })
vim.keymap.set("n", '<leader>pu', "<cmd>lua vim.pack.update()<CR>", { desc = 'update plugins' })
vim.keymap.set("n", '<leader>pp', "<cmd>lua vim.pack.update(nil, { offline = true })<CR>",
  { desc = 'show installed plugins' })
vim.keymap.set("n", '<leader>pd', function()
  vim.ui.input({ prompt = 'Enter packages to remove: ' }, function(input)
    if input then
      vim.pack.del({ input })
    end
  end)
end, { desc = 'delete plugins' })

vim.keymap.set('n', "<leader><space>", "<cmd>lua Snacks.picker.smart()<CR>", { desc = "Smart Find Files" })
vim.keymap.set('n', "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", { desc = "Buffers" })
vim.keymap.set('n', "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", { desc = "Find Files" })
vim.keymap.set('n', "<leader>fg", "<cmd>lua Snacks.picker.grep_word()<CR>", { desc = "Visual selection or word" })
vim.keymap.set('n', "<leader>f/", "<cmd>lua Snacks.picker.grep()<CR>", { desc = "Grep" })
vim.keymap.set('n', "<leader>fp", "<cmd>lua Snacks.picker.projects()<CR>", { desc = "Projects" })
vim.keymap.set('n', "<leader>fr", "<cmd>lua Snacks.picker.recent()<CR>", { desc = "Recent" })
vim.keymap.set('n', "<leader>fh", "<cmd>lua Snacks.picker.help()<CR>", { desc = "Help Pages" })
vim.keymap.set('n', "<leader>f:", "<cmd>lua Snacks.picker.command_history()<CR>", { desc = "Command History" })
vim.keymap.set('n', "<leader>fu", "<cmd>lua Snacks.picker.undo()<CR>", { desc = "Undo History" })
vim.keymap.set('n', "<leader>fU", "<cmd>Undotree<CR>", { desc = "Undo History" })
vim.keymap.set('n', "<leader>fc", '<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath("config") })<CR>',
  { desc = "Find Config File" })
vim.keymap.set('n', "<leader>fj", "<cmd>lua Snacks.picker.jumps() <CR>", { desc = "Jumps" })
vim.keymap.set('n', "<leader>fk", "<cmd>lua Snacks.picker.keymaps() <CR>", { desc = "Keymaps" })
vim.keymap.set('n', "<leader>fS", "<cmd>lua Snacks.scratch.select()<CR>", { desc = "Select Scratch Buffer" })
vim.keymap.set('n', "<leader>u.", "<cmd>lua Snacks.scratch()<CR>", { desc = "Toggle Scratch Buffer" })

vim.keymap.set('n', "<leader>et", "<cmd>lua Snacks.explorer()<CR>", { desc = "File Explorer" })
vim.keymap.set('n', "<leader>ee", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set('n', '<leader>ef', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })
vim.keymap.set('n', '<leader>ed', '<cmd>Yazi cwd<cr>', { desc = "Open the file manager in nvim's working directory" })
vim.keymap.set('n', '<c-y>', '<cmd>Yazi toggle<cr>', { desc = 'Resume the last yazi session' })

vim.keymap.set('n', "<leader>gb", "<cmd>lua Snacks.picker.git_branches()<CR>", { desc = "Git Branches" })
vim.keymap.set('n', "<leader>gl", "<cmd>lua Snacks.picker.git_log()<CR>", { desc = "Git Log" })
vim.keymap.set('n', "<leader>gL", "<cmd>lua Snacks.picker.git_log_line()<CR>", { desc = "Git Log Line" })
vim.keymap.set('n', "<leader>gs", "<cmd>lua Snacks.picker.git_status()<CR>", { desc = "Git Status" })
vim.keymap.set('n', "<leader>gS", "<cmd>lua Snacks.picker.git_stash()<CR>", { desc = "Git Stash" })
vim.keymap.set('n', "<leader>gd", "<cmd>lua Snacks.picker.git_diff()<CR>", { desc = "Git Diff (Hunks)" })
vim.keymap.set('n', "<leader>gf", "<cmd>lua Snacks.picker.git_log_file()<CR>", { desc = "Git Log File" })
vim.keymap.set('n', "<leader>gf", "<cmd>lua Snacks.picker.git_files()<CR>", { desc = "Find Git Files" })
vim.keymap.set('n', "<c-/>", "<cmd>lua Snacks.terminal.toggle() <CR>", { desc = "Toggle Terminal" })
vim.keymap.set('n', "<c-_>", "<cmd>lua Snacks.terminal() <CR>", { desc = "which_key_ignore" })

vim.keymap.set("n", '<leader>la', ":lua vim.lsp.buf.code_action() <CR>", { desc = 'apply action' })
vim.keymap.set("n", '<leader>ln', ":lua vim.lsp.buf.rename() <CR>", { desc = 'rename symbol' })
vim.keymap.set("n", '<leader>lr', ":lua vim.lsp.buf.references() <CR>", { desc = 'show references to symbol' })
vim.keymap.set("n", '<leader>li', ":lua vim.lsp.buf.implementation() <CR>", { desc = 'list implementations' })
vim.keymap.set("n", '<leader>ld', ":lua vim.lsp.buf.type_definition() <CR>", { desc = 'show type definition' })
vim.keymap.set("n", '<leader>lh', "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
vim.keymap.set("n", '<leader>lh', "<cmd>ClangdTypeHierarchy<cr>", { desc = "Switch Source/Header (C/C++)" })
vim.keymap.set("n", "<leader>ls", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>lS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>",
  { desc = "LSP Workspace Symbols" })

vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", { desc = "Goto Definition" })
vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", { desc = "Goto Implementation" })
vim.keymap.set('n', "gy", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", { desc = "Goto T[y]pe Definition" })
vim.keymap.set('n', "gai", "<cmd>lua Snacks.picker.lsp_incoming_calls()<CR>", { desc = "C[a]lls Incoming" })
vim.keymap.set('n', "gao", "<cmd>lua Snacks.picker.lsp_outgoing_calls()<CR>", { desc = "C[a]lls Outgoing" })

vim.keymap.set('n', "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "(Trouble) Diagnostics", })
vim.keymap.set('n', "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "(Trouble) Symbols", })
vim.keymap.set('n', "<leader>dL", "<cmd>Trouble loclist toggle<cr>", { desc = "(Trouble) Location List", })
vim.keymap.set('n', "<leader>dQ", "<cmd>Trouble qflist toggle<cr>", { desc = "(Trouble) Quickfix List", })
vim.keymap.set('n', "<leader>dd", "<cmd>lua Snacks.picker.diagnostics()<CR>", { desc = "Diagnostics" })
vim.keymap.set('n', "<leader>dD", "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>", { desc = "Buffer Diagnostics" })
vim.keymap.set('n', "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "(Trouble) Buffer Diagnostics", })
vim.keymap.set('n', "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "(Trouble) LSP Definitions / references", })


--vim.keymap.set("n", "<leader>dd", ":DapViewToggle<CR>", { desc = "toggle debug adapter" })
-- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
-- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
-- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
