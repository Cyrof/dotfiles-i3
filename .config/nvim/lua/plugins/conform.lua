return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
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
            sql = { "sql_formatter" },

            -- web stack
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            json = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            tmpl = { "prettier" },
        },
    },
}
