return {
    "stevearc/conform.nvim",
    event = { "BufWritePre "},
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            go = { "goimports" },
            lua = { "stylua" },
            python = { "black" },
            yaml = { "prettier" },
            markdown = { "prettier" },
        },
    },
}
