-- Movement
vim.keymap.set('i', '<Up>', '<C-o>g<Up>')
vim.keymap.set({'n', 'v'}, '<Up>', 'g<Up>')
vim.keymap.set('i', '<Down>', '<C-o>g<Down>')
vim.keymap.set({'n', 'v'}, '<Down>', 'g<Down>')

-- Text movement
vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>')
vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>')
vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>')
vim.keymap.set('n', '<A-Left>', ':MoveWord(-1)<CR>')
vim.keymap.set('n', '<A-Right>', ':MoveWord(1)<CR>')
vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>')

-- Copy and Paste
vim.keymap.set('v', '<C-S-c>', '"+y', { silent = true, desc = 'Copy' })
vim.keymap.set('n', '<C-S-c>', '"+yy', { silent = true, desc = 'Copy' })
vim.keymap.set('i', '<C-S-v>', '<C-r>+"', { silent = true, desc = 'Paste' })
vim.keymap.set({'n', 'v'}, '<C-S-v>', '"+p', { silent = true, desc = 'Paste' })

-- Tabs
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true, desc = 'Next tab' })
vim.keymap.set('n', '<Leader>x', ':bdelete<CR>', { silent = true, desc = 'Close tab' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true, desc = 'Previous tab' })

-- Pick
vim.keymap.set('n', '<Leader>sf', ':Pick files<CR>', { silent = true, desc = 'Pick files' })
vim.keymap.set('n', '<Leader>st', ':Pick explorer<CR>', { silent = true, desc = 'Pick files in tree' })
vim.keymap.set('n', '<Leader>/', ':Pick buf_lines<CR>', { silent = true, desc = 'Pick lines in buffer' })
vim.keymap.set('n', '<Leader><Leader>', ':Pick oldfiles<CR>', { silent = true, desc = 'Pick recent files' })
vim.keymap.set('n', '<Leader>sg', ':Pick grep_live<CR>', { silent = true, desc = 'Pick grep in directory' })

-- Files
vim.keymap.set('n', '<Leader>n', function() require('mini.files').open(); require('mini.files').trim_left() end, { silent = true, desc = 'File explorer' })
vim.keymap.set('n', '<Leader>N', function() vim.cmd.cd('~'); require('mini.files').open() end, { silent = true, desc = 'File explorer' })

-- Sorting
vim.keymap.set('v', '<Leader>sa', ':sort<CR>', { silent = true, desc = 'Sort alphabetically' })
vim.keymap.set('v', '<Leader>sl', [[:! awk '{ len=length($0); pad="00000"; print substr(pad,1,5-length(len "")) len, $0 }' | sort -n | cut -c7-<CR>]], { silent = true, desc = 'Sort lines by length' })

-- Languages
vim.keymap.set("n", "<leader>gt", function()
  local filename = vim.fn.expand("%:p")
  if not filename:match("%.typ$") then
    print("Not a .typ file, bro.")
    return
  end

  local pdf = filename:gsub("%.typ$", ".pdf")

  local cmd = string.format("typst watch %s & zathura %s", filename, pdf)

  vim.fn.jobstart(cmd, {
    detach = true,
    on_exit = function(_, code)
      if code == 0 then
        print("✅ typst & zathura launched")
      else
        print("❌ Failed to run typst or zathura")
      end
    end
  })
end, { desc = "Start typst watch and zathura", noremap = true, silent = true })
