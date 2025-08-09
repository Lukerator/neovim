return {
	filetypes = { "lua" },
	cmd = { "lua-language-server" },
	settings = { Lua = { runtime = { version = 'LuaJIT' }}}	,
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' }
}
