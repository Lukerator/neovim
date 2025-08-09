vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.rs", "*.c", "*.cpp" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})
