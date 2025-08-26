vim.o.autochdir = true -- automatically change directory to current file
vim.o.cursorline = true -- highlight current line
vim.o.expandtab = true -- convert tabs to spaces
vim.o.foldenable = true -- enable folding
vim.o.foldlevel = 99 -- start with all folds open
vim.o.foldlevelstart = 99 -- start with all folds open
vim.o.foldmethod = 'indent' -- fold based on indent
vim.o.guifont = 'MonaspiceNe NFM' -- set gui font
vim.o.ignorecase = true -- ignore case when searching
vim.o.mouse = 'vih' -- enable mouse support in visual, insert and help mode
vim.o.number = true -- show line number
vim.o.relativenumber = true -- show relative line numbers
vim.o.scrolloff = 20 -- minimum number of lines to keep above and below the cursor
vim.o.shiftwidth = 4 -- number of spaces to use for autoindent
vim.o.smartcase = true -- override ignorecase if search pattern contains upper case
vim.o.smartindent = true -- smart autoindenting when starting new line
vim.o.softtabstop = 4 -- number of spaces to insert when tab is pressed
vim.o.splitbelow = true -- open new vertical split below current window
vim.o.splitright = true -- open new horizontal split to the right of current window
vim.o.tabstop = 4 -- number of spaces that a <Tab> in the file counts for
vim.o.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.o.undofile = true -- enable persistent undo
vim.o.undolevels = 100 -- maximum number of changes that can be undone
vim.o.winborder = 'none' -- default window border style

require('vim._extui').enable {}

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        vim.o.expandtab = true
        vim.o.shiftwidth = 4
        vim.o.softtabstop = 4
        vim.o.tabstop = 4
    end
})
