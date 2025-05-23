
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {
            disabled_filetype = { "TelescropePrompt", "vim" },
            enabled_moveright = true,
            enabled_afterquote = true,
            check_ts = true,
        }
    end,
}
