-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Safe require
      local ok, telescope = pcall(require, "telescope")
      if not ok then
        vim.notify("telescope not found—skipping setup", vim.log.levels.WARN)
        return
      end

      -- Main setup
      telescope.setup({
        defaults = {
          prompt_prefix    = "🔍 ",
          selection_caret  = "❯ ",
          path_display     = { "truncate" },
          layout_config    = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            width          = 0.87,
            height         = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = { "node_modules/", ".git/", ".DS_Store" },
        },
        extensions = {
          -- any custom extension configs
        },
      })

      -- Load extensions if available
      pcall(function() telescope.load_extension("fzf") end)

      -- Builtin pickers
      local builtin = require("telescope.builtin")

      -- Regular mappings
      vim.keymap.set("n", "<leader>ff", builtin.find_files,        { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,         { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,           { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,         { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions,   { desc = "Find definitions" })
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references,    { desc = "Find references" })

      -- Toggle picker helper
      local function toggle_telescope()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_get_option(buf, "filetype") == "TelescopePrompt" then
            vim.api.nvim_win_close(win, true)
            return
          end
        end
        builtin.find_files()
      end

      -- Map the toggle
      vim.keymap.set("n", "<leader>t", toggle_telescope, { desc = "Toggle Telescope" })
    end,
  },
}

