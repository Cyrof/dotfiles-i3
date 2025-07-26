return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = "|" },
                change       = { text = "|" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                -- preview hunk
                map("n", "<leader>gp", gs.preview_hunk, "Preview Git hunk")

                -- navigate hunks
                map("n", "]h", gs.next_hunk, "Next Git hunk")
                map("n", "[h", gs.prev_hunk, "Previous Git hunk")

                -- toggle inline blame
                map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle inline Git blame")
            end,
        })
    end,
}
