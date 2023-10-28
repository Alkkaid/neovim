return {
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    },
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    -- Useful plugin to show you pending keybinds.
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
            enable_autocmd = false,
        },
    },
    { 'folke/which-key.nvim',  opts = {} },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },

    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        config = function()
            require("plugins.config.ibl")
        end
    },
    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require("plugins.config.comment")
        end

    },
    --  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    --My Plugins
    --use 'mfussenegger/nvim-jdtls'
    'ThePrimeagen/harpoon',
    "windwp/nvim-autopairs",
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- Colorschemes
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "arturgoms/moonbow.nvim" },
    { "rebelot/kanagawa.nvim" },


    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    -- local has_plugins, plugins = pcall(require, 'custom.plugins')
    -- if has_plugins then
    --   plugins(use)
    -- end
}
