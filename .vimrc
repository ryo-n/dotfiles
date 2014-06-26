syntax on
filetype on
autocmd FileType c,cpp,perl set cindent
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

set backspace=indent,eol,start 
set expandtab
set tabstop=4
set softtabstop=0
set number
set smartindent
set incsearch
set autoindent
set shiftwidth=4
set backup
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

call pathogen#runtime_append_all_bundles()

"------------------------------------
" unite.vim
"------------------------------------
" $BF~NO%b!<%I$G3+;O$9$k(B
"let g:unite_enable_start_insert=1

" $B%P%C%U%!0lMw(B
noremap <C-U><C-B> :Unite buffer<CR>
" $B%U%!%$%k0lMw(B
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" $B:G6a;H$C$?%U%!%$%k$N0lMw(B
noremap <C-U><C-R> :Unite file_mru<CR>
" $B%l%8%9%?0lMw(B
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" $B%U%!%$%k$H%P%C%U%!(B
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" $BA4It(B
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESC$B%-!<$r(B2$B2s2!$9$H=*N;$9$k(B
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
