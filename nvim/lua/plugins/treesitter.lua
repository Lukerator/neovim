return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			indent = { enable = true },
			highlight = { enable = true },
			incremental_selection = { enable = true },
			ensure_installed = { "cpp", "lua", "norg" },
		})
	end,
}
