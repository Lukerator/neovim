vim.keymap.set("n", "<Tab>", ":BufferNext<CR>", { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>", { silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<Leader>x", ":BufferClose<CR>", { silent = true, desc = "Close Buffer" })
