-- Lazy.nvim
require("misc/lazyboot")
require("config/globals")
require("misc/lazysetup")

-- Configurations
require("lsp/lua")
require("lsp/cpp")
require("config/options")

-- Keymaps
require("keymaps/cpp")
require("keymaps/oil")
require("keymaps/rust")
require("keymaps/sort")
require("keymaps/error")
require("keymaps/neorg")
require("keymaps/barbar")
require("keymaps/waybar")
require("keymaps/movement")
require("keymaps/copypaste")

-- Autocmds
require("autocmds/yank")
require("autocmds/cursor")
require("autocmds/trailing")
require("autocmds/recording")
require("autocmds/norgindent")
