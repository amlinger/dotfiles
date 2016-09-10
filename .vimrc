" Necesary for lots of cool vim things, I've been told.
" Among other things, it's useful for running this .vimrc
" with single vim instances with the same privilages as
" a global .vimrc
set nocompatible

"---------------------------------------------------
"        Bundle options.
"---------------------------------------------------

" This is necessary to run vundle.
filetype off

" Vundle is a plugin manager :BundleInstall can be used
" to install said plugins.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

"
" Bundle list.
"
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'

"---------------------------------------------------
"        Editor style settings
"---------------------------------------------------

" Show line numbers"
set number

" Use syntax highlighting
syntax enable

" Set characters for finding trailing whitespace.
set list
set listchars=eol:¬,tab:>-,trail:•,extends:>,precedes:<

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Because it is easier to use spaces instead of tabs as
" indentation.
set expandtab
set shiftwidth=2
set softtabstop=2
