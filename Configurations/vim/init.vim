"" Made by: Sal O'Rak
 
call plug#begin()
 
"" Highly extendable fuzzy finder over lists. 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 
"" Themes. Lean & mean status/tablin for vims thta's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
"" Syntax checking plugin. It runs files through external syntax
"" checker and siplays any resulting erros to the users. 
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim' "Rust Checker
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
