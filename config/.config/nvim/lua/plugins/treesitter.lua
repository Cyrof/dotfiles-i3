return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        priority = 100,

        config = function()
            local ts = require("nvim-treesitter")

            ts.setup()

            ts.install({
                "lua", "vim", "vimdoc", "javascript", "typescript", "python",
                "rust", "go", "html", "css", "json", "yaml", "toml",
                "markdown", "bash", "proto",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua", "vim", "vimdoc", "javascript", "typescript", "python",
                    "rust", "go", "html", "css", "json", "yaml", "toml",
                    "markdown", "bash", "proto",
                },
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
