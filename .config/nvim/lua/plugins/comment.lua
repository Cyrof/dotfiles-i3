return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local comment = require("Comment")

            comment.setup({
                toggler = { line = "gcc", block = "gbc" },
                opleader = { line = "gc", block = "gb" },
            })

            local api = require("Comment.api")

            -- Normal mode mappings
            vim.api.nvim_set_keymap("n", "<leader>/l", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>/b", "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>",
                { noremap = true, silent = true })

            -- Visual mode mappings (use :vmap and lua function to get correct range)
            vim.api.nvim_set_keymap("x", "<leader>/l",
                ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("x", "<leader>/b",
                ":lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
                { noremap = true, silent = true })
        end,
    },
}
