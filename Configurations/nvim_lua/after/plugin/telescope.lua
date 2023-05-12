-- Add default mappings to move around telescope
require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ['C-j'] = require('telescope.actions').move_selection_next,
                ['C-k'] = require('telescope.actions').move_selection_previous
            }
        }
    }
}


-- Find files & file string keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Command history
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})

-- Helping pages
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})

-- Fuzzy Finder algorithm using telescope fzf native
pcall(require('telescope').load_extension, 'fzf')


