set nocompatible
syntax on

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
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

set background=dark
colorscheme solarized

call glaive#Install()
Glaive codefmt plugin[mappings]
augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

set autoindent
set shiftwidth=2 expandtab softtabstop=2 tabstop=2

" set back 2 space tabs after ftplugin sets them to 4
autocmd FileType python set shiftwidth=2 expandtab softtabstop=2 tabstop=2

