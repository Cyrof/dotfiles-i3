return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
            opts = {},
            format = {
                cmdline = { pattern = "^:", icon = "", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                input = { view = "cmdline_input", icon = "󰥻 " },
            },

            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
            },

            popupmenu = {
                enabled = true,
                backend = "nui",
            },

            notify = {
                enabled = true,
                view = "notify",
            },

            lsp = {
                progress = { enabled = true, view = "mini" },
                hover = { enabled = true },
                signature = { enabled = true },
                message = { enabled = true, view = "notify" },
            },

            presets = {
                command_palette = true,
                lsp_doc_border = true,
            },
        },

        config = function(_, opts)
            local ok, notify = pcall(require, "notify")
            if ok then
                notify.setup({ timeout = 3000 })
                vim.notify = notify
            end

            require("noice").setup(opts)

            local map = vim.keymap.set
            local km_opts = { noremap = true, silent = true }
            map("n", "<leader>sn", "<cmd>Noice history<cr>", km_opts)
            map("n", "<leader>sm", "<cmd>Noice last<cr>", km_opts)
            map("n", "<leader>se", "<cmd>Noice errors<cr>", km_opts)
            map("n", "<leader>sc", "<cmd>Noice dismiss<cr>", km_opts)
            map("n", "<leader>sa", "<cmd>Noice all<cr>", km_opts)
        end,
    }
}
