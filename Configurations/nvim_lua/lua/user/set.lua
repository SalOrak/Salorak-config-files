-- Command to change editor settings

-- Set leader map to Space
vim.g.mapleader = " "

-- Numbers on the left + relative number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Identation fix
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Search highlight progressively (incremental search)
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Termguicolors 
vim.opt.termguicolors = true

-- Keeps at least 8 rows below or above at any time, except on EOF
vim.opt.scrolloff = 8

-- Turn off statusline
vim.opt.laststatus= 0

-- Update time 
vim.opt.updatetime = 50

-- Show typed command in status bar
vim.opt.showcmd = true

-- Show file title in status bar
-- vim.opt.title= false

-- Status line
--vim.opt.statusline = "%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
