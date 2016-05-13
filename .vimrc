set nocompatible
filetype off                     " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'

" Editor style settings
set number                       " Show line numbers
syntax enable                    " Use syntax highlighting
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

" Because it is easier to use spaces instead of tabs as
" indentation.
set expandtab
set shiftwidth=2
set softtabstop=2
