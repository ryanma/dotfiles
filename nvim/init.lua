-- mini.nvim config
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Safely execute immediately
now(function()
  vim.o.termguicolors = true
  -- vim.cmd('colorscheme randomhue')
end)
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
  add({ source = 'rebelot/kanagawa.nvim', })
  -- vim.o.colorscheme = "kanagawa"
  vim.cmd([[colorscheme kanagawa]])
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)

-- Safely execute later
later(function() require('mini.ai').setup() end)
later(function() require('mini.basics').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.cursorword').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.files').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.surround').setup() end)

now(function()
  -- Use other plugins with `add()`. It ensures plugin is available in current
  -- session (installs if absent)
  add({
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim',  'williamboman/mason-lspconfig.nvim' },
  })

  vim.lsp.enable('ruby_lsp')
  add({
      source = "Saghen/blink.cmp",
      depends = { "rafamadriz/friendly-snippets" },
      checkout = "v1.3.0"
  })
  require('blink.cmp').setup()

  add({
    source = 'nvim-telescope/telescope.nvim',
    checkout = '0.1.8',
    depends = {
            'nvim-lua/plenary.nvim',
            "nvim-treesitter/nvim-treesitter"
        }
  })

  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'ruby' },
    highlight = { enable = true },
  })
end)

later(function()

  add({ source = 'tpope/vim-fugitive' })
  add({ source = 'lewis6991/gitsigns.nvim' })
  add({ source = 'swaits/zellij-nav.nvim',
  })
  require("zellij-nav").setup()

  local map = vim.keymap.set
  map("n", "<A-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { desc = "navigate left or tab"  })
  map("n", "<A-j>", "<cmd>ZellijNavigateDown<cr>",  { desc = "navigate down"  })
  map("n", "<A-k>", "<cmd>ZellijNavigateUp<cr>",    { desc = "navigate up"    })
  map("n", "<A-l>", "<cmd>ZellijNavigateRightTab<cr>", { desc = "navigate right or tab" })

  add({ source = "jpalardy/vim-slime", 

  })
  vim.g.slime_target

  add({
    source = "pwntester/octo.nvim", 
    depends = { 'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope.nvim',
                'nvim-tree/nvim-web-devicons',
    }
  })

  require('keymaps')
  require('settings')
end)
