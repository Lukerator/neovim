local git = 'https://github.com/'
local plugins = {
  { conf = 0, dev = 'hrsh7th', name = 'nvim-cmp' }, -- cmp modules -- codeium
  { conf = 1, dev = 'echasnovski', name = 'mini.ai' }, -- better around/inside
  { conf = 0, dev = 'neovim', name = 'nvim-lspconfig' }, -- lsp
  { conf = 1, dev = 'windwp', name = 'nvim-autopairs' }, -- autopairs
  { conf = 1, dev = 'echasnovski', name = 'mini.pick' }, -- fuzzy picker
  { conf = 0, dev = 'nvim-lua', name = 'plenary.nvim' }, -- plenary - codeium
  { conf = 1, dev = 'echasnovski', name = 'mini.icons' }, -- icons for mini
  { conf = 1, dev = 'echasnovski', name = 'mini.extra' }, -- extras for mini
  { conf = 1, dev = 'echasnovski', name = 'mini.notify' }, -- notifications
  { conf = 1, dev = 'echasnovski', name = 'mini.tabline' }, -- tabline
  { conf = 1, dev = 'echasnovski', name = 'mini.comment' }, -- comment lines
  { conf = 1, dev = 'fedepujol', confname = 'move', name = 'move.nvim' }, -- move text
  { conf = 1, dev = 'OXY2DEV', confname = 'markview', name = 'markview.nvim' }, -- preview for files
  { conf = 1, dev = 'Exafunction', confname = 'codeium', name = 'codeium.nvim' }, -- ai completion
  { conf = 1, dev = 'Aasim-A', confname = 'scrollEOF', name = 'scrollEOF.nvim' }, -- scroll beyond EOF

  {
    conf = 0,
    name = 'oxocarbon.nvim',
    dev = 'nyoom-engineering',
    init = function() vim.cmd.colorscheme('oxocarbon') end
  }, -- theme

  {
    conf = 1,
    name = 'mini.clue',
    dev = 'echasnovski',
    opts = {
      window = { delay = 150 },
      triggers = {
        { mode = 'n', keys = '<Space>' },
        { mode = 'x', keys = '<Leader>' }
      }
    }
  }, -- Keymap hints

  {
    conf = 1,
    dev = 'echasnovski',
    name = 'mini.starter',
    opts = {
      footer = function()
        local stats = vim.tbl_deep_extend(
          'force',
          { startup_time = 0, count = 0 },
          (vim.g.lazy_stats or {})
        )

        local plugin_count = stats.count or 0
        local startup_time = stats.startup_time or 0

        return string.format('%d plugins loaded in %.2fms', plugin_count, startup_time)
      end,
      header = function()
        if tonumber(os.date('%H')) < 12 then return 'Good morning, Luke'
        elseif tonumber(os.date('%H')) < 18 then return 'Good afternoon, Luke'
        else return 'Good evening, Luke' end
      end
    }
  }, -- starting page

  {
    conf = 1,
    dev = 'echasnovski',
    name = 'mini.files',
    opts = {
      mappings = {
        reset = '',
        close = '<Esc>',
        go_out = '<BS>',
        go_in = '<Right>',
        synchronize = ':w',
        go_in_plus = '<CR>',
        go_out_plus = '<Left>'
      }
    }
  }, -- extras for mini

  {
    conf = 1,
    dev = 'echasnovski',
    name = 'mini.statusline',
    opts = {
      use_icons = true,
      content = {
        active = function()
          local wc = tostring(vim.fn.wordcount().words or 0)
          local mode = MiniStatusline.section_mode({ trunc_width = 120 })
          local filename = MiniStatusline.section_filename({ trunc_width = 140 })

          return MiniStatusline.combine_groups({
            { hl = 'MiniStatuslineDevinfo', strings = { mode } },
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineDevinfo', strings = { wc .. ' words' } },
          })
        end
      }
    }
  }, -- statusline

  {
    conf = 1,
    dev = 'saghen',
    name = 'blink.cmp',
    version = vim.version.range('1'),
    opts = {
      fuzzy = { implementation = 'lua' },
      signature = { window = { border = 'rounded' } },
      cmdline = { completion = { menu = { auto_show = true } } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = { codeium = { name = 'Codeium', module = 'codeium.blink', async = true } },
      },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
      },
      completion = {
        documentation = {
          auto_show = true,
          window = { border = 'rounded' }
        },
        menu = {
          border = 'rounded',
          draw = { components = {
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
            }
          }}
        },
      }
    }
  } -- autocompletion
}

local list = {}

for _, p in ipairs(plugins) do
  local plugin = { src = git .. p.dev .. '/' .. p.name }
  if p.version then plugin.version = p.version end
  table.insert(list, plugin)
end

vim.pack.add(list)

for _, p in pairs(plugins) do
  if p.conf == 1 then
    require(p.confname or p.name).setup(p.opts or {})
  end
  if type(p.init) == 'function' then
    p.init()
  end
end
