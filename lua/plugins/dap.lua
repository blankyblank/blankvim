vim.pack.add({
	-- "https://github.com/mfussenegger/nvim-dap",
	Gh("mfussenegger/nvim-dap"),
	-- "https://github.com/rcarriga/nvim-dap-ui"
	Gh("rcarriga/nvim-dap-ui"),
	Gh("nvim-neotest/nvim-nio"),
})

local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}

--require("dapui").setup()
--vim.api.nvim_create_autocmd({'BufEnter'}, {
--  pattern = {"*.hl", "hypr*.conf",},
--  callback = function(event)
--    print(string.format("starting hyprls for %s", vim.inspect(event)))
--    vim.lsp.start {
--      name = "hyprlang",
--      cmd = {"hyprls"},
--      root_dir = vim.fn.getcwd(),
--    }
--  end
--})
