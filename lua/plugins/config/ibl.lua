local highlight = {
    -- "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "┊" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = {
        enabled = true,
        show_exact_scope = true,
        -- highlight = { "Function", "Label" },
    },
}

-- require("ibl").setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
--   space_char_blankline = " ",
--   show_current_context = true,
--   show_current_context_start = true,
-- }


-- require("ibl").setup(config)
