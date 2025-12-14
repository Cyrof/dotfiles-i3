return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = function()
        local util = require("conform.util")

        return {
            format_on_save = function(bufnr)
                local ft = vim.bo[bufnr].filetype

                if ft == "yaml.ansible" then
                    return {
                        timeout_ms = 5000,
                        lsp_fallback = true,
                    }
                end

                return {
                    timeout_ms = 500,
                    lsp_fallback = true,
                }
            end,
            formatters_by_ft = {
                go = { "goimports" },
                lua = { "stylua" },
                python = { "black" },
                yaml = { "prettier" },
                ["yaml.ansible"] = { "prettier" },
                markdown = { "prettier" },
                sql = { "sql_formatter" },
                proto = { "clang_format" },

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
                tmpl = { "prettier_tmpl" },
            },
            formatters = {
                clang_format = {
                    prepend_args = {
                        "--style=file",
                    },
                },
                prettier = {
                    prepend_args = {
                        "--config-precedence=prefer-file",
                    },
                    cwd = util.root_file({ ".prettierrc", ".prettierrc.json", "package.json" }),
                    require_cwd = false,
                },
                prettier_tmpl = {
                    command = "prettier",
                    args = { "--stdin-filepath", "$FILENAME", "--parser", "html" },
                    stdin = true,
                },
            },
        }
    end,
}
