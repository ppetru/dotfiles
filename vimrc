set nocompatible
syntax on

set autoindent
set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2

set showmode
set showmatch
set ruler
set showcmd
set incsearch
set hlsearch
set backspace=2
set visualbell

"Highlight text over 80 chars
au BufNewFile,BufRead *.vimrc,*.c,*.cc,*.h,*.java,*.py,*.rules match TooLong /\%<82v.\%>81v/
hi link TooLong Warning
hi Warning ctermbg=Grey ctermfg=DarkRed

let g:jsx_ext_required = 0

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'

call plug#end()

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

set background=dark
colorscheme solarized
