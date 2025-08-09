vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" }
}
vim.lsp.config['luals'] = {
  filetypes = { 'lua' },
  cmd = { 'lua-language-server' },
  settings = { Lua = { runtime = { version = 'LuaJIT' } } },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' }
}
vim.lsp.enable('luals')
vim.lsp.enable('tinymist')
