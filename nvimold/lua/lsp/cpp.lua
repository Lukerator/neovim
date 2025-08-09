vim.lsp.config["clangd"] = {
	filetypes = { "c", "cpp", "objc", "objcpp" },
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
	},
}

vim.lsp.enable("clangd")
