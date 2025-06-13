return {
	version = "^1.0.0",
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		clickable = true,
		tabpages = false,
		auto_hide = false,
		icons = {
			button = false,
			buffer_index = false,
			buffer_number = false,
		},
	},
}
