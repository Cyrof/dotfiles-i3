return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        priority = 100,
        -- any setup logic here:
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "lua", "vim", "vimdoc", "javascript", "typescript", "python",
                    "rust", "go", "html", "css", "json", "yaml", "toml",
                    "markdown", "bash",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<TAB>",
                        node_decremental = "<BS>",
                    },
                },
            }
        end,
    },
}
