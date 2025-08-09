vim.keymap.set("v", "<Leader>sa", ":sort<CR>", { silent = true, desc = "Sort alphabetically" })
vim.keymap.set(
	"v",
	"<Leader>sl",
	[[:! awk '{ len=length($0); pad="00000"; print substr(pad,1,5-length(len "")) len, $0 }' | sort -n | cut -c7-<CR>]],
	{ silent = true, desc = "Sort lines by length" }
)
