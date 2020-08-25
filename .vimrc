" Plugins
call plug#begin()

Plug 'reewr/vim-monokai-phoenix'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-obsession'

call plug#end()

"Plugin config
silent! colorscheme monokai-phoenix

let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
set noshowmode

let g:rustfmt_autosave=1

" Syntax highlighting
syntax on

" Line numbers
set number

" Tab configuration
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set hlsearch

set hidden

