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
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'

" Color schemes
Plugin 'morhetz/gruvbox'

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

set termguicolors

set background=dark
colorscheme gruvbox

" Because it is easier to use spaces instead of tabs as
" indentation.
set expandtab
set shiftwidth=2
set softtabstop=2

" Configure Git Gutter
" Messy configuration for making Git gutter use Gruvbox color scheme.
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
hi clear SignColumn
set statusline=%=%P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode

"---------------------------------------------------
"        Editor general settings
"---------------------------------------------------

" Make vim autoload changed files from disk while in editor.
set autoread

" Necessary for MacOS clipboard issues in tmux on Sierra:
" https://stackoverflow.com/questions/39645253/
set clipboard=unnamed

" Remove trailing whitespaces on save
autocmd BufWritePre *.py :%s/\s\+$//e
