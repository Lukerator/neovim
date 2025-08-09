vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.norg",
	callback = function()
		vim.cmd("silent! normal! gg=G``")
	end,
})
