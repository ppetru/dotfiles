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

call plug#begin('~/.vim/plugged')
call plug#end()

