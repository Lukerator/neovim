vim.api.nvim_create_user_command('PackDel', function(opts)
  local names = {}
  for name in string.gmatch(opts.args, '%S+') do
    table.insert(names, name)
  end
  vim.pack.del(names)
end, { nargs = '*', desc = 'Delete plugins from disk via vim.pack' })

vim.api.nvim_create_user_command('PackList', function()
  local plugins = vim.pack.get()
  for _, p in ipairs(plugins) do
    print(('- %s (active: %s)'):format(p.spec.name or '?', tostring(p.active)))
  end
end, { desc = 'List plugins managed by vim.pack' })

vim.api.nvim_create_user_command('PackUpdate', function(opts)
  local names = {}
  for name in string.gmatch(opts.args, '%S+') do
    table.insert(names, name)
  end
  if #names == 0 then names = nil end
  vim.pack.update(names)
end, { nargs = '*', desc = 'Update plugins via vim.pack' })

vim.api.nvim_create_user_command('PackClean', function()
  local output = vim.api.nvim_exec('PackList', true)
  local to_remove = {}

  for line in output:gmatch('[^\r\n]+') do
    local name, active = line:match('^- ([^%s]+) %(%s*active:%s*(%w+)%s*%)')
    if name and active == 'false' then
      table.insert(to_remove, name)
    end
  end

  if #to_remove == 0 then
    print('No inactive plugins found.')
    return
  end

  print('Inactive plugins detected:')
  for _, name in ipairs(to_remove) do
    print('  - ' .. name)
  end

  vim.ui.select({ 'Yes', 'No' }, {
    prompt = 'Remove these plugins?',
  }, function(choice)
    if choice == 'Yes' then
      for _, name in ipairs(to_remove) do
        vim.cmd('PackDel ' .. name)
      end

      print('Removed the following plugins:')
      for _, name in ipairs(to_remove) do
        print('  - ' .. name)
      end
    else
      print('No plugins were removed.')
    end
  end)
end, {})
