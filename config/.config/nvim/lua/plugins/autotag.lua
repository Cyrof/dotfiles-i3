return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-ts-autotag").setup({
            filetypes = {
                "html", "xml", "javascript", "javascriptreact", "typescriptreact",
                "tsx", "jsx", "vue", "svelte", "astro", "templ"
            },
        })
    end,
}
