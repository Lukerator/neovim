return {
	lazy = false,
	"stevearc/oil.nvim",
	opts = {
		use_default_keymaps = false,
		skip_confirm_for_simple_edits = true,
		view_options = { show_hidden = false },
		float = { max_height = 25, max_width = 60 },
		keymaps = {
			["<S-CR>"] = "actions.cd",
			["?"] = "actions.show_help",
			["<BS>"] = "actions.parent",
			["<CR>"] = "actions.select",
			["<Esc>"] = "actions.close",
			["."] = "actions.toggle_hidden",
		},
	},
}
