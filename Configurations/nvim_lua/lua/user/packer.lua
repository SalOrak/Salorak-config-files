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

use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require ('nvim-treesitter.install').update({with_sync = true})
        ts_update()
    end,}


use ('theprimeagen/harpoon') -- Fast file/terminal switcher. Game changer.
use ('SirVer/ultisnips') -- Snippets 
use ('lervag/vimtex') -- Latex integration

use ('tpope/vim-fugitive') -- Git integration

-- Status line plus icons 
use {
  'nvim-lualine/lualine.nvim',
}

-- LSP Configuration
 use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

end)
