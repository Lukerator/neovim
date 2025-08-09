return {
	{
		version = "1.*",
		"saghen/blink.cmp",
		opts_extend = { "sources.default" },
		dependencies = {
			"hrsh7th/nvim-cmp",
			"onsails/lspkind.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"rafamadriz/friendly-snippets",
			{
				"Exafunction/windsurf.nvim",
				config = function()
					require("codeium").setup()
				end,
			},
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						{ "nvim-dap-ui" },
					},
				},
			},
		},
		opts = {
			appearance = { nerd_font_variant = "mono" },
			signature = { window = { border = "rounded" } },
			fuzzy = {
				sorts = { "exact", "score", "sort_text" },
				implementation = "prefer_rust_with_warning",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "codeium" },
				providers = {
					codeium = { async = true, name = "Codeium", module = "codeium.blink" },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
			},
			enabled = function()
				local path = vim.api.nvim_buf_get_name(0)
				if string.find(path, "oil://", 1, true) == 1 then
					return false
				end
				return true
			end,
			completion = {
				documentation = { window = { border = "rounded" } },
				menu = {
					border = "rounded",
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},
		},
	},
}
