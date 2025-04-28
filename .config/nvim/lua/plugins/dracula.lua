return {
    {
        "dracula/vim",              -- the official Dracula colorscheme
        as = "dracula",             -- give it a short name
        config = function()
          -- set termguicolors if you haven’t already
          vim.opt.termguicolors = true
          -- finally, load the colorscheme:
          vim.cmd("colorscheme dracula")
        end,
    },
}
