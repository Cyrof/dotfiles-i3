-- Basic settings 
vim.o.number = true -- enable line numbers
vim.o.tabstop = 4 -- number of spaces a tab represents
vim.o.shiftwidth = 4 -- number of spaces for each indentation 
vim.o.expandtab = true -- convert tabs to spaces 
vim.o.smartindent = true -- automatically indent new lines 
vim.o.wrap = false -- disable line wrapping
vim.o.cursorline = true -- highlight the current line
vim.o.termguicolors = true -- enable 24-bit RGB colors
vim.o.clipboard = "unnamedplus"

-- syntax highlighting and fil.etype plugins 
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ',' 
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- load lazy nvim
local ok, err = pcall(require, "config.lazy")
if not ok then 
    -- print it on screen and stop exiting
    print("lazy.nvim bootstrap error:\n", err)
    return
end
