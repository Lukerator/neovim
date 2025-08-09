return {
	event = "VimEnter",
	"nvimdev/dashboard-nvim",
	opts = {
		theme = "hyper",
		disable_move = true,
		shortcut_type = "letter",
		change_to_vcs_root = true,
		config = {
			project = { enable = false },
			footer = { "", "Make cool shit" },
			mru = { enable = true, limit = 5, icon = " " },
			shortcut = {
				{ desc = "New file ", group = "@property", action = "enew", key = "n" },
				{ desc = "Find files ", group = "@property", action = "FzfLua files", key = "f" },
			},
		},
	},
}
