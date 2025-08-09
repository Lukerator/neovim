vim.keymap.set("n", "<Leader>ea", ":Lspsaga code_action<CR>", { silent = true, desc = "Error quickfix" })
vim.keymap.set("n", "<Leader>eq", ":Trouble qflist toggle<CR>", { silent = true, desc = "Error quickfix" })
vim.keymap.set("n", "<Leader>ed", ":Trouble diagnostics toggle<CR>", { silent = true, desc = "Error diagnostics" })
