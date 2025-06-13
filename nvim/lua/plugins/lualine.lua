return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "auto",
			ignore_focus = {},
			globalstatus = false,
			icons_enabled = true,
			always_show_tabline = true,
			always_divide_middle = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = {}, winbar = {} },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "filename", symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" } },
			},
			lualine_c = {
				function()
					if vim.fn.reg_recording() == "" then
						return ""
					end
					return "Recording to @" .. vim.fn.reg_recording()
				end,
			},
			lualine_x = {
				function()
					return tostring(vim.fn.wordcount().words)
				end,
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
