-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' 

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ('nvim-telescope/telescope-fzf-native.nvim') -- Fuzzy Finder for telescope

    use ({ 'ajmwagar/vim-deus',
    as = "deus",
    config = function()
        vim.cmd('colorscheme deus')
    end
})

use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Tree Sitter
use ('theprimeagen/harpoon') -- Fast file/terminal switcher. Game changer.
use ('SirVer/ultisnips') -- Snippets 
use ('lervag/vimtex') -- Latex integration

-- use ('tpope/fugitive.lua') Git integration

end)
