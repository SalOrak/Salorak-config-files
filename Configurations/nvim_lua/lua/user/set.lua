-- Command to change editor settings
--

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

-- Dont want termguicoloros as I'm using alacritty
vim.opt.termguicolors = false


-- Keeps at least 8 rows below or above at any time, except on EOF
vim.opt.scrolloff = 8


