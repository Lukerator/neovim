vim.pack.add { 'https://github.com/folke/lazy.nvim' }

require('lazy').setup {
    checker = { enabled = true },
    spec = {
        {
            opts = {},
            event = 'BufRead',
            'numtostr/comment.nvim',
        },
        {
            'cohama/lexima.vim',
            event = 'InsertEnter',
        }, -- auto close pairs
        {
            event = 'VeryLazy',
            'folke/which-key.nvim',
            opts = { preset = 'helix' },
        },
        {
            lazy = false,
            'rebelot/kanagawa.nvim',
            config = function()
                vim.cmd.colorscheme 'kanagawa'
            end,
        }, -- colorscheme
        {
            lazy = false,
            'echasnovski/mini.starter',
            opts = {
                footer = function()
                    return 'Make cool shit\n' .. require('lazy').stats().count .. ' plugins'
                end,
            },
        }, -- startup
        {
            opts = {},
            event = 'BufRead',
            'fedepujol/move.nvim',
            init = function()
                vim.keymap.set('n', '<a-up>', '<cmd>MoveLine(-1)<cr>', { silent = true, desc = 'move line up' })
                vim.keymap.set('v', '<a-up>', '<cmd>MoveBlock(-1)<cr>', { silent = true, desc = 'move block up' })
                vim.keymap.set('n', '<a-down>', '<cmd>MoveLine(1)<cr>', { silent = true, desc = 'move line down' })
                vim.keymap.set('v', '<a-down>', '<cmd>MoveBlock(1)<cr>', { silent = true, desc = 'move block down' })
            end,
        }, -- move
        {
            lazy = false,
            'saghen/blink.indent',
            opts = {
                scope = {
                    highlights = {
                        'BlinkIndentRed',
                        'BlinkIndentOrange',
                        'BlinkIndentYellow',
                    },
                },
            },
        }, -- indent bars
        {
            event = 'BufRead',
            'neovim/nvim-lspconfig',
            config = function()
                vim.lsp.config['lua_ls'] = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            diagnostics = { globals = { 'vim' } },
                        },
                    },
                }
                vim.lsp.enable 'clangd'
                vim.lsp.enable 'lua_ls'
                vim.lsp.enable 'pyright'
                vim.lsp.enable 'tinymist'
            end,
        }, -- language servers
        {
            cmd = { 'Oil' },
            'stevearc/oil.nvim',
            keys = { { mode = 'n', '<leader>n', '<cmd>Oil --float<cr>', desc = 'file manager' } },
            opts = {
                use_default_keymaps = false,
                skip_confirm_for_simple_edits = true,
                view_options = { show_hidden = false },
                float = { max_height = 25, max_width = 60 },
                keymaps = {
                    ['<S-CR>'] = 'actions.cd',
                    ['?'] = 'actions.show_help',
                    ['<BS>'] = 'actions.parent',
                    ['<CR>'] = 'actions.select',
                    ['<Esc>'] = 'actions.close',
                    ['.'] = 'actions.toggle_hidden',
                },
            },
        }, -- file manager
        {
            'ibhagwan/fzf-lua',
            dependencies = 'echasnovski/mini.icons',
            cmd = { 'FzfLua' },
            keys = {
                { mode = 'n', '<leader>sf', '<cmd>FzfLua files<cr>', desc = 'files' },
                { mode = 'n', '/', '<cmd>FzfLua blines<cr>', desc = 'search in buffer' },
                { mode = 'n', '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'quickfix' },
                { mode = 'n', '<leader>sc', '<cmd>FzfLua registers<cr>', desc = 'clipboard' },
                { mode = 'n', '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'live grep' },
                { mode = 'n', '<leader><leader>', '<cmd>FzfLua oldfiles<cr>', desc = 'recent files' },
                { mode = 'n', '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'diagnostics' },
                {
                    mode = 'n',
                    '<leader>sa',
                    function()
                        require('fzf-lua').register_ui_select()
                        vim.cmd 'FzfLua lsp_code_actions'
                    end,
                    desc = 'code actions',
                },
            },
        }, -- picker
        {
            lazy = true,
            'stevearc/conform.nvim',
            cmd = { 'ConformInfo' },
            opts = {
                formatters_by_ft = {
                    lua = { 'stylua' },
                    python = { 'yapf' },
                    cpp = { 'clang_format' },
                },
                formatters = {
                    clang_format = { cmd = 'clang-format', prepend_args = { '-style={IndentWidth: 4}' } },
                    yapf = { prepend_args = { '--style={based_on_style: pep8, indent_width: 4}' } },
                },
            },
            keys = {
                {
                    mode = 'n',
                    '<leader>f',
                    function()
                        require('conform').format { async = true }
                    end,
                    desc = 'format',
                },
            },
        }, -- formatting
        {
            lazy = false,
            'nvim-lualine/lualine.nvim',
            opts = {
                options = {
                    theme = 'auto',
                    ignore_focus = {},
                    globalstatus = false,
                    icons_enabled = true,
                    always_show_tabline = true,
                    always_divide_middle = true,
                    -- section_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    -- component_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = { statusline = {}, winbar = {} },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = {
                        { 'filename', symbols = { modified = ' ', readonly = ' ', unnamed = '[No Name]' } },
                    },
                    lualine_c = {},
                    lualine_x = {
                        function()
                            return tostring(vim.fn.wordcount().words)
                        end,
                    },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            },
        }, -- statusline
        {
            'voldikss/vim-floaterm',
            cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermHide', 'FloatermKill' },
            keys = {
                {
                    mode = 'n',
                    '<leader>gc',
                    '<cmd>FloatermNew --autoclose=0 fish -c "g++ -o %:p:r %:p -g && clear && %:p:r && rm %:p:r"<cr>',
                    desc = 'compile and run gcc',
                },
                {
                    mode = 'n',
                    '<leader>gC',
                    '<cmd>FloatermNew --autoclose=0 fish -c "g++ -o %:p:r %:p -g && clear && %:p:r && rm %:p:r"<cr>',
                    desc = 'compile and run gcc debug',
                },
                {
                    mode = 'n',
                    '<leader>gl',
                    '<cmd>FloatermNew --autoclose=0 fish -c "lua %:p"<cr>',
                    desc = 'run lua',
                },
                {
                    mode = 'n',
                    '<leader>gp',
                    '<cmd>FloatermNew --autoclose=0 fish -c "python3 %:p"<cr>',
                    desc = 'run python',
                },
                {
                    mode = 'n',
                    '<leader>gm',
                    '<cmd>FloatermNew --autoclose=0 fish -c "manim -pqh %:p && mv %:p:h/media/videos/%:r/1080p60/*.mp4 %:p:h/ && rm -rf %:p:h/media && rm -rf %:p:h/__pycache__"<cr>',
                    desc = 'compile manim',
                },
            },
        }, -- floaterm
        {
            lazy = true,
            event = 'BufRead',
            'kevinhwang91/nvim-ufo',
            dependencies = 'kevinhwang91/promise-async', -- async
            config = function()
                require('ufo').setup {
                    provider_selector = function()
                        return { 'treesitter', 'indent' }
                    end,
                    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                        local newVirtText = {}
                        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                        local sufWidth = vim.fn.strdisplaywidth(suffix)
                        local targetWidth = width - sufWidth
                        local curWidth = 0
                        for _, chunk in ipairs(virtText) do
                            local chunkText = chunk[1]
                            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                            if targetWidth > curWidth + chunkWidth then
                                table.insert(newVirtText, chunk)
                            else
                                chunkText = truncate(chunkText, targetWidth - curWidth)
                                local hlGroup = chunk[2]
                                table.insert(newVirtText, { chunkText, hlGroup })
                                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                                if curWidth + chunkWidth < targetWidth then
                                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                                end
                                break
                            end
                            curWidth = curWidth + chunkWidth
                        end
                        table.insert(newVirtText, { suffix, 'MoreMsg' })
                        return newVirtText
                    end,
                }
            end,
        }, -- folding
        {
            lazy = true,
            version = '1.*',
            'saghen/blink.cmp',
            event = 'InsertEnter',
            dependencies = {
                'echasnovski/mini.icons', -- icons
                'rafamadriz/friendly-snippets', -- snippets
                {
                    'exafunction/windsurf.nvim',
                    config = function()
                        require('codeium').setup()
                    end,
                    dependencies = {
                        'hrsh7th/nvim-cmp', -- completion engine
                        {
                            'nvim-lua/plenary.nvim',
                        }, -- utility functions
                    },
                }, -- completion with AI
            },
            opts = {
                fuzzy = { implementation = 'prefer_rust_with_warning' },
                signature = { window = { border = 'none' } },
                cmdline = { completion = { menu = { auto_show = true } } },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
                    providers = { codeium = { name = 'Codeium', module = 'codeium.blink', async = true } },
                },
                keymap = {
                    preset = 'none',
                    ['<cr>'] = { 'accept', 'fallback' },
                    ['<tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
                    ['<s-tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
                },
                enabled = function()
                    local path = vim.api.nvim_buf_get_name(0)
                    if string.find(path, 'oil://', 1, true) == 1 then
                        return false
                    end
                    return true
                end,
                completion = {
                    documentation = {
                        auto_show = true,
                        window = { border = 'none' },
                    },
                    menu = {
                        border = 'none',
                        draw = {
                            components = {
                                kind_icon = {
                                    text = function(ctx)
                                        local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                        return kind_icon
                                    end,
                                    highlight = function(ctx)
                                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                        return hl
                                    end,
                                },
                                kind = {
                                    highlight = function(ctx)
                                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                        return hl
                                    end,
                                },
                            },
                        },
                    },
                },
            },
        }, -- completion
    },
}
