return {
	config = true,
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
		{
			"mfussenegger/nvim-dap",
			config = function()
				require("dap").adapters.codelldb = {
					type = "executable",
					command = "codelldb",
				}
				require("dap").configurations.cpp = {
					{
						type = "codelldb",
						request = "launch",
						stopOnEntry = false,
						name = "Launch file",
						cwd = "${workspaceFolder}",
						program = function()
							return vim.fn.expand("%:p:r")
						end,
					},
				}
				require("dap").configurations.c = require("dap").configurations.cpp
				require("dap").configurations.rust = require("dap").configurations.cpp
			end,
		},
	},
}
