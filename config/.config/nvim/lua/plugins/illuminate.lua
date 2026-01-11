return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local illuminate = require("illuminate")

        illuminate.configure({
            delay = 200,
            filetypes_denylist = {
                "NvimTree",
                "neo-tree",
                "alpha",
                "dashboard",
                "lazy",
                "mason",
                "help",
            },
            providers = {
                "lsp",
                "treesitter",
                "regex"
            },
            under_cursor = true,
            large_file_cutoff = 10000,
            min_count_to_highlight = 1,
            disable_keymaps = true,
        })

        -- Keymaps for jumping between references
        local map = vim.keymap.set
        local opts = { silent = true, noremap = true }

        map("n", "]r", function()
            illuminate.goto_next_reference(false)
        end, vim.tbl_extend("force", opts, { desc = "Next reference" }))

        map("n", "[r", function()
            illuminate.goto_prev_reference(false)
        end, vim.tbl_extend("force", opts, { desc = "Prev reference " }))

        map("n", "<leader>ui", function()
            vim.b.illuminate_disabled = not vim.b.illuminate_disabled
        end, vim.tbl_extend("force", opts, { desc = "Toggler Illuminate" }))
    end,
}
