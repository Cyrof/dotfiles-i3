return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup({
                toggler = { line = "gcc", block = "gbc" },
                opleader = { line = "gc", block = "gb" },
            })

            -- keymap for line comment
            vim.api.nvim_set_keymap("n", "<leader>/l", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("x", "<leader>/l",
                "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
                { noremap = true, silent = true })

            -- keymap for block comment
            vim.api.nvim_set_keymap("n", "<leader>/b", "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("x", "<leader>/b",
                "<cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
                { noremap = true, silent = true })
        end,
    },
}
