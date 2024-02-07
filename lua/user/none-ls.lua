local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_lsp_client,
        null_ls.builtins.formatting.prettier,
    },
})


vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = '[?] Find recently opened files' })
