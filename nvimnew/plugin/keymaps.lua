-- copying with <c-s-c>
vim.keymap.set({ 'n', 'v' }, '<c-s-c>', '"+y')
vim.keymap.set('i', '<c-s-c>', '<c-o>"+y')

-- pasting with <c-s-v>
vim.keymap.set('i', '<c-s-v>', '<c-r>+')
vim.keymap.set({ 'n', 'v' }, '<c-s-v>', '"+p')

-- insert mode mappings to go up and down a wrapped line
vim.keymap.set('i', '<up>', '<c-o>g<up>')
vim.keymap.set('i', '<down>', '<c-o>g<down>')

-- normal and visual mode mappings to go up and down a wrapped line
vim.keymap.set({ 'n', 'v' }, '<up>', 'g<up>')
vim.keymap.set({ 'n', 'v' }, '<down>', 'g<down>')

-- sort visual selection based on length or alphabetical order
vim.keymap.set('v', '<leader>sa', '<cmd>sort<cr>')
vim.keymap.set(
    'v',
    '<leader>sl',
    [[:! awk '{ len=length($0); pad="00000"; print substr(pad,1,5-length(len "")) len, $0 }' | sort -n | cut -c7-<CR>]],
    { silent = true, desc = 'Sort lines by length' }
)
