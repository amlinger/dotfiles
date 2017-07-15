" Necessary for lots of cool vim things, I've been told.
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
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Bundle list.
"
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'

" Color schemes
Plugin 'Valloric/YouCompleteMe'
" Plugin 'amlinger/vim-panda-syntax'

" End Bundle bundle definition
call vundle#end()
filetype plugin indent on

let g:python_host_prog='/usr/bin/python'

"---------------------------------------------------
"        Editor style settings
"---------------------------------------------------

" Enforce 80 character limit.
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Show line numbers"
set number

" Use syntax highlighting
syntax enable

" Set characters for finding trailing whitespace.
set list
set listchars=eol:¬,tab:>-,trail:•,extends:>,precedes:<

" Enable multiple cursors
" let g:multicursor_insert_maps
" let g:multicursor_normal_maps

" Set the colorscheme to solarized, and to use the dark theme. Using 16
" termcolors is necessary.
set background=dark
let g:solarized_termcolors=256
let g:solarized_menu=1

" colorscheme solarized
" colorscheme panda_syntax

" Because it is easier to use spaces instead of tabs as
" indentation.
set expandtab
set shiftwidth=2
set softtabstop=2

"---------------------------------------------------
"        Editor general settings
"---------------------------------------------------

" Make vim autoload changed files from disk while in editor.
set autoread
"
