vim.keymap.set("v", "<C-S-c>", '"+y')
vim.keymap.set("n", "<C-S-c>", '"+yy')
vim.keymap.set("i", "<C-S-v>", "<C-r>+")
vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p')
