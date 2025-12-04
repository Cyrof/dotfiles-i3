-- ~/.config/nvim/lua/plugins/whichkey.lua
return {
    {
        "folke/which-key.nvim",
        opts = {
            plugins = {
                marks     = true,
                registers = true,
                spelling  = { enabled = true, suggestions = 20 },
                presets   = {
                    operators    = true,
                    motions      = true,
                    text_objects = true,
                    windows      = true,
                    nav          = true,
                    z            = true,
                    g            = true,
                },
            },
            win = { border = "rounded", padding = { 2, 2, 2, 2 } },
            layout = {
                height = { min = 4, max = 25 },
                width  = { min = 20, max = 50 },
            },

            filter = function(mapping)
                return mapping.desc and mapping.desc ~= ""
            end,
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            wk.add({
                -- Buffer prefix
                { "<leader>b",  group = "Buffer" },
                { "<leader>bd", "<cmd>bdelete<cr>",                                               desc = "Delete Buffer" },
                { "<leader>bn", "<cmd>bnext<cr>",                                                 desc = "Next Buffer" },
                { "<leader>bp", "<cmd>bprevious<cr>",                                             desc = "Previous Buffer" },

                -- Explorer
                { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                        desc = "Explorer" },

                -- File prefix
                { "<leader>f",  group = "File" },
                { "<leader>fb", "<cmd>Telescope buffers<cr>",                                     desc = "Buffers" },
                { "<leader>ff", "<cmd>Telescope find_files<cr>",                                  desc = "Find File" },
                { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                   desc = "Live Grep" },
                { "<leader>fn", "<cmd>enew<cr>",                                                  desc = "New File" },
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                                    desc = "Recent Files" },

                -- LSP prefix
                { "<leader>l",  group = "LSP" },
                { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>",                              desc = "Rename" },
                { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                         desc = "Code Action" },
                { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>",                             desc = "Definitions" },
                { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                              desc = "Format" },
                { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>",                               desc = "Hover" },
                { "<leader>lr", "<cmd>Telescope lsp_references<cr>",                              desc = "References" },

                -- markdown preview prefix
                { "<leader>m",  group = "Markdown" },
                { "<leader>mp", "<cmd>MarkdownPreview<cr>",                                       desc = "Toggle Preview" },

                -- comment prefix
                { "<leader>/",  group = "Comment" },
                { "<leader>/l", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",  desc = "Line Comment" },
                { "<leader>/b", "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>", desc = "Block Comment" },

                -- Git prefix
                { "<leader>g",  group = "Git" },
                { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>",                desc = "Preview Hunk" },
                { "<leader>gb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>",   desc = "Toggle Blame" },
                { "]h",         "<cmd>lua require('gitsigns).next_hunk()<cr>",                    desc = "Next Hunk" },
                { "[h",         "<cmd>lua require('gitsigns').prev_hunk()<cr>",                   desc = "Previous Hunk" },

                -- Illuminate
                { "]r",         "<cmd>lua require('illuminate').goto_next_reference(false)<cr>",  desc = "Next Reference" },
                { "r[",         "<cmd>lua require('illuminate').goto_prev_reference(false)<cr>",  desc = "Previous Reference" },

                -- Noice
                { "<leader>s",  group = "Search/Messages" },
                { "<leader>sn", "<cmd>Noice history<cr>",                                         desc = "Noice History" },
                { "<leader>sm", "<cmd>Noice last<cr>",                                            desc = "Last Message" },
                { "<leader>se", "<cmd>Noice errors<cr>",                                          desc = "Error Messages" },
                { "<leader>sc", "<cmd>Noice dismiss<cr>",                                         desc = "Dismiss Messages" },
                { "<leader>sa", "<cmd>Noice all<cr>",                                             desc = "All Messages" },
            })
        end,
    },
}
