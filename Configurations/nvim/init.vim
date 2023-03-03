"" Made by: Sal O'Rak
 
call plug#begin()
 
"" Telescope Highly extendable fuzzy finder over lists. 
""" Telescope Dependencies
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 
"" Themes. 
""" Status theme: Lean & mean status/tablin for vims thta's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""" Status theme
Plug 'ajmwagar/vim-deus'

"" UltiSnips is the ultimate solution for snippets in Vim. it has many
"" features speed being one of the
Plug 'SirVer/ultisnips'
 
"" Syntax checking plugin. It runs files through external syntax
"" checker and siplays any resulting erros to the users. 
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim' "Rust Checker
Plug 'lervag/vimtex' "LaTeX checker

call plug#end()
 
 
" #########################
" # General Configuration #
" #########################
"" Set 'nocompatible' to ward off unexpected things that your distro might
"" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Atttempt to determine the type of a file based on itsname and possibly its
" contets.
" Use this to allow intelligent auto-indenting for each filetype, and for
" plugins that are filetype specific.
if has('filetype')
	filetype indent plugin on
endif
 
" Enable syntax highlighting
if has('syntax')
	syntax on
endif
 
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" Keep the same indent as the line you're currently on
set autoindent
 
" Display line numbers on the left. 
" It uses relative numbers for all lines except the current line
set number
set relativenumber


" Status theme
let g:airline_theme = 'deus'

" Colorscheme theme
colorscheme deus

" UltiSnips Configuration
"" Trigger configuration
let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" Telescope Configuration
"" Find files
let mapleader=" "
nnoremap <leader>ff <cmd>Telescope find_files hidden=true theme=dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=dropdown<cr>


set listchars=eol:↵,trail:~,tab:>-,nbsp:␣

lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
    },
  }
}
EOF
