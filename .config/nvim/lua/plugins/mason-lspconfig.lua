return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        after = "nvim-lspconfig",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "tsserver",
                "rust_analyzer",
                "gopls",
                "clangd",
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
}
