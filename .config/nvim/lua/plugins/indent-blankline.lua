return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        indent = {
            char = "|",
            tab_char = "|",
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = false,
        },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "NvimTree",
                "lazy",
                "mason",
                "",
            },
        },
    },
    config = function(_, opts)
        local ibl = require("ibl")
        ibl.setup(opts)

        vim.keymap.set("n", "<leader>ui", function()
            local enabled = vim.g.indent_blankline_enabled
            vim.g.indent_blankline_enabled = not enabled
            if enabled then
                vim.cmd("IBLDisable")
            else
                vim.cmd("IBLEnable")
            end
        end, { desc = "Toggle indent guides", silent = true, noremap = true })
    end,
}
