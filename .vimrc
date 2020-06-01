set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent
set smartindent
set number
set backspace=indent,eol,start
set ruler
set showcmd
colorscheme koehler
syntax enable
nnoremap ZX :w<Enter><C-z>

:set list
:set listchars=trail:~,tab:>.

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.c,*.cpp
    \ setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html
    \ setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js,*.css,*.json
    \ setlocal softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.py,*.php
    \ setlocal softtabstop=4 shiftwidth=4
augroup END

" augroup cursorToMain
"   autocmd!
"   autocmd BufRead *.cpp :/\<main\>/
" augroup END

" command! -nargs=* -complete=shellcmd ShellRead new | setlocal buftype=nofile bufhidden=hide noswapfile | read !<args>
" cabbrev Sh ShellRead
