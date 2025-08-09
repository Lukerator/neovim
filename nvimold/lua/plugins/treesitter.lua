return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "OXY2DEV/markview.nvim", config = true },
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
