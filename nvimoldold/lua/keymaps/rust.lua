vim.keymap.set(
	"n",
	"<leader>gr",
	':FloatermNew --autoclose=0 bash -c "rustc %:p && clear && %:p:r && rm %:p:r"<CR>',
	{ silent = true, desc = "Compile cpp file" }
)
vim.keymap.set(
	"n",
	"<leader>gxr",
	':FloatermNew --autoclose=0 bash -c "rustc %:p && clear && %:p:r"<CR>',
	{ silent = true, desc = "Compile cpp file" }
)

vim.keymap.set("n", "<leader>dsO", ":DapStepOut<CR>", { silent = true, desc = "[D]ebug [S]tep [O]ut" })
vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { silent = true, desc = "[D]ebug [T]erminate" })
vim.keymap.set("n", "<leader>dsi", ":DapStepInto<CR>", { silent = true, desc = "[D]ebug [S]tep [i]nto" })
vim.keymap.set("n", "<leader>dso", ":DapStepOver<CR>", { silent = true, desc = "[D]ebug [S]tep [o]ver" })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { silent = true, desc = "[D]ebug Toggle [B]reakpoint" })

vim.keymap.set("n", "<leader>dc", function()
	require("dapui").toggle()
	require("dap").continue()
end, { silent = true, desc = "[D]ebug [C]ontinue" })

vim.keymap.set("n", "<leader>du", function()
	require("dapui").close()
	require("dap").close()
end, { silent = true, desc = "[D]ebug Stop R[u]nning" })
