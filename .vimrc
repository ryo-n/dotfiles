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
set t_Co=256


"call pathogen#runtime_append_all_bundles()

"------------------------------------
"Neo Bundle
"------------------------------------

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/vimproc'
let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })


NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'ujihisa/unite-colorscheme'
NeoBundleCheck

 call neobundle#end()

filetype plugin indent on

colorscheme jellybeans

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
