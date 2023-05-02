vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 


vim.keymap.set("n", "J", "mzJ`z")

-- Keep centered while scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Copy function using shortcut
vim.keymap.set("n", "yaf", "va{Vy}")
vim.keymap.set("n", "yif", "vi{Vy}")

-- Remap jk to Esc (enter normal mode without pressing Esc)
vim.keymap.set("i", "jk", "<Esc>")

