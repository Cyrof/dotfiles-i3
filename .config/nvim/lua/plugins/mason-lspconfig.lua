return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
        },
        after = "mason.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "tsserver",
                "rust_analyzer",
                "gopls",
                "clangd",
                "yamlls",
                "marksman",
                "sqls",
                -- web stack
                "html",
                "cssls",
                "emmet_ls",
                "tailwindcss",
                "jsonls",
                "eslint",
                "stylelint_lsp",
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
        end,
    },
}
