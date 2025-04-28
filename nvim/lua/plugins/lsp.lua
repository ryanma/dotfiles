return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    "williamboman/mason.nvim", 
    { "williamboman/mason-lspconfig.nvim", config = function() end },
    "neovim/nvim-lspconfig",
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        }
    },
    { "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { "all" },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        lazy = false,
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader> ', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-treesitter/nvim-treesitter"
        }
    }
}
