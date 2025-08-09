return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({ "default-title" })
		vim.keymap.set("n", "<Leader>sf", ":FzfLua files<CR>", { silent = true, desc = "Search files" })
		vim.keymap.set("n", "<Leader>sr", ":FzfLua resume<CR>", { silent = true, desc = "Search resume" })
		vim.keymap.set("n", "<Leader>sb", ":FzfLua builtin<CR>", { silent = true, desc = "Search builtins" })
		vim.keymap.set("n", "<Leader>sg", ":FzfLua live_grep<CR>", { silent = true, desc = "Search by grep" })
		vim.keymap.set("n", "<Leader>/", ":FzfLua blines<CR>", { silent = true, desc = "Search in current buffer" })
		vim.keymap.set("n", "<Leader>sw", ":FzfLua grep_cword<CR>", { silent = true, desc = "Search current word" })
		vim.keymap.set("n", "<Leader><leader>", ":FzfLua oldfiles<CR>", { silent = true, desc = "Search recent files" })
	end,
}
