return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- safe require
            local ok, nvim_tree = pcall(require, "nvim-tree")
            if not ok then 
                vim.notify("nvim-tree not found, skipping explorer setup", vim.log.levels.WARN)
                return
            end

            -- Main setup
            nvim_tree.setup({
                sort_by = "case_sensitive",
                view = { width = 30 },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            git = true,
                            file = true,
                            folder = true,
                            folder_arrow = true,
                        },
                    },
                },
                filters = { dotfiles = false },
                git = { enable = true, ignore = false }, 
                actions = {
                    open_file = { quit_on_open = false, resize_window = true },
                },
            })
        
            -- keybindings 
            vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle file explorer" })
            vim.keymap.set('n', '<leader>fe', '<cmd>NvimTreeFocus<CR>', { desc = "Focus file explorer" })
        end,
    },
}
