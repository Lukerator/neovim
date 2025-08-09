-- mini.deps locals
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- colorscheme
add("rebelot/kanagawa.nvim")
now(function()
	vim.cmd("colorscheme kanagawa")
end)

-- non-lazy plugins
now(function()
	require("mini.snippets").setup()
	require("mini.starter").setup({
		footer = "Make cool shit",
		header = function()
			if tonumber(os.date("%H")) < 12 then
				return "Good morning, Luke"
			elseif tonumber(os.date("%H")) < 18 then
				return "Good afternoon, Luke"
			else
				return "Good evening, Luke"
			end
		end,
	})
end)

-- lazy mini plugins
later(function()
	require("mini.ai").setup()
	require("mini.clue").setup()
	require("mini.align").setup()
	require("mini.extra").setup()
	require("mini.files").setup()
	require("mini.icons").setup()
	require("mini.pairs").setup()
	require("mini.notify").setup()
	require("mini.comment").setup()
  require("mini.completion").setup()
	require("mini.cursorword").setup()
  require("mini.statusline").setup()
	require("mini.move").setup({
		options = { reindent_linewise = true },
		mappings = {
			up = "<M-up>",
			down = "<M-down>",
			left = "<M-left>",
			line_up = "<M-up>",
			right = "<M-right>",
			line_left = "<M-left>",
			line_down = "<M-down>",
			line_right = "<M-right>",
		},
	})
end)
