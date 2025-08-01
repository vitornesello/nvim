--[[

=====================================================================
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||     taken from     ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||    vitornesello    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Do not wrap lines
vim.opt.wrap = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- Go to next line when moving cursor with the arrows
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

-- emacs on insert mode
vim.keymap.set('i', '<C-A>', '<Home>', { desc = 'Emacs: go to the beginning of the line', noremap = true })
vim.keymap.set('i', '<C-E>', '<End>', { desc = 'Emacs: go to the end of the line', noremap = true })
vim.keymap.set('i', '<C-B>', '<Left>', { desc = 'Emacs: move cursor one character to the left', noremap = true })
vim.keymap.set('i', '<C-F>', '<Right>', { desc = 'Emacs: move cursor one character to the right', noremap = true })
vim.keymap.set('i', '<C-P>', '<Up>', { desc = 'Emacs: move cursor to the previous line', noremap = true })
vim.keymap.set('i', '<C-N>', '<Down>', { desc = 'Emacs: move cursor to the next line', noremap = true })
vim.keymap.set('i', '<C-d>', '<Del>', { desc = 'Emacs: delete one character to the left', noremap = true })
vim.keymap.set('i', '<M-d>', '<C-o>de', { desc = 'Emacs: delete one word to the right', noremap = true })
vim.keymap.set('i', '<M-BS>', '<C-w>', { desc = 'Emacs: delete one word to the left', noremap = true })
vim.keymap.set('i', '<M-b>', '<S-Left>', { desc = 'Emacs: move cursor one word to the left', noremap = true })
vim.keymap.set('i', '<M-f>', '<S-Right>', { desc = 'Emacs: move cursor one word to the right', noremap = true })
vim.keymap.set('i', '<C-K>', '<C-o>d$', { desc = 'Emacs: delete until the end of the line', noremap = true })

vim.keymap.set('n', '<M-1>', ':tabn 1<CR>', { desc = 'select tab 1', noremap = true })
vim.keymap.set('n', '<M-2>', ':tabn 2<CR>', { desc = 'select tab 2', noremap = true })
vim.keymap.set('n', '<M-3>', ':tabn 3<CR>', { desc = 'select tab 3', noremap = true })
vim.keymap.set('n', '<M-4>', ':tabn 4<CR>', { desc = 'select tab 4', noremap = true })

vim.keymap.set('n', '<leader>q]', ':cnext<CR>', { desc = 'go to next quickfix', noremap = true })
vim.keymap.set('n', '<leader>q[', ':cprev<CR>', { desc = 'go to previous quickfix', noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<M-d>', 'viwxi', { desc = 'Replace word under cursor' })

vim.g.copilot_no_tab_map = true
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Disable copilot by default',
  group = vim.api.nvim_create_augroup('copilot', { clear = true }),
  command = 'Copilot disable',
})
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight columns in rust, julia and markdown modes
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.rs' },
  desc = 'Highlight columns when in rust file',
  group = vim.api.nvim_create_augroup('highlight-col-rs', { clear = true }),
  callback = function()
    vim.api.nvim_set_option_value('colorcolumn', '90,100', {})
  end,
})

-- Highlight columns in julia and markdown modes
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.jl, *.md' },
  desc = 'Highlight columns when in julia and markdown files',
  group = vim.api.nvim_create_augroup('highlight-col-jl-md', { clear = true }),
  callback = function()
    vim.api.nvim_set_option_value('colorcolumn', '80,92', {})
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close buffer without closing window
vim.api.nvim_create_user_command('CloseBuf', ': bn|:bd#', {})
vim.keymap.set('n', '<leader>ww', ':CloseBuf<CR>', { noremap = true, desc = 'Close current buffer without closing window' })

-- Comment selected lines
vim.keymap.set({ 'n', 'v' }, '<leader>cc', ':Commentary<CR>', { noremap = true, desc = 'Comment selected lines' })

-- Search and replace word under cursor
vim.keymap.set({ 'n' }, '<leader>s', ':%s/<C-r><C-w>/', { noremap = true, desc = 'Search and replace word under cursor' })

-- Open Oil
vim.keymap.set({ 'n' }, '<leader>oi', ':Oil<CR>', { noremap = true, desc = 'Open [Oi]l' })

-- Toggle colorizer
vim.keymap.set({ 'n' }, '<leader>tc', ':ColorizerToggle<CR>', { noremap = true, desc = '[T]oggle [C]olorizer' })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  { 'tpope/vim-commentary' },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },

  {
    'Mr-LLLLL/interestingwords.nvim',
    init = function()
      require('interestingwords').setup {
        colors = { '#EADFB4', '#EF476F', '#f5f5f5', '#9999FF', '#FFD166', '#06D6A0' },
        search_count = false,
        navigation = true,
        scroll_center = false,
        search_key = '<leader>m',
        cancel_search_key = '<leader>M',
        color_key = '<leader>k',
        cancel_color_key = '<leader>K',
        select_mode = 'loop',
      }
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
  },

  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<M-h>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<M-j>', '<cmd>TmuxNavigateDown<cr>' },
      { '<M-k>', '<cmd>TmuxNavigateUp<cr>' },
      { '<M-l>', '<cmd>TmuxNavigateRight<cr>' },
    },
  },

  {
    'mg979/vim-visual-multi',
    init = function()
      vim.g.VM_leader = '<SPACE><SPACE>'
    end,
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  { 'github/copilot.vim' },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      require('monokai-pro').setup()
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        html = { 'prettier' },
      },
    },
  },
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
