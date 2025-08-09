vim.lsp.config['luals'] = {
  filetypes = { 'lua' },
  cmd = { 'lua-language-server' },
  settings = { Lua = { runtime = { version = 'LuaJIT' } } }
}
vim.lsp.enable('luals')
