
return {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
    config = function()
        require("neoscroll").setup({
            mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
            hide_cursor = true,
            stop_eof = true,
            use_local_scrolloff = false,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            easing_function = "quadratic"
        })
    end,
}
