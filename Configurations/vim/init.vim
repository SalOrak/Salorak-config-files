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
