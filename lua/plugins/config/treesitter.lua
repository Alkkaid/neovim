-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
        'c',
        'cpp',
        'go',
        'lua',
        'python',
        'rust',
        'typescript',
        'vim',
        'java',
        'typescript',
        'tsx',
        'json',
        'javascript',
        'prisma',
    },
    --
    -- nvim-ts-commentstring
    -- Removed for compatibility reasons
    -- context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    -- },
    -- nvim-ts-autotag
    autotag = {
        enable = true,
    },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python', 'html' } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            -- scope_incremental = '<c-s>',
            scope_incremental = false,
            node_decremental = '<c-backspace>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },


                ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
                ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameters/argument with next" },
                -- ["<leader>n:"] = "@property.outer", -- swap object property with next
                ["<leader>nm"] = "@function.outer", -- swap function with next
            },
            swap_previous = {
                ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
                -- ["<leader>p:"] = "@property.outer",  -- swap object property with prev
                ["<leader>pm"] = "@function.outer",  -- swap function with previous
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },

    },
}
