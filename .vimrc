syntax on
filetype off
filetype plugin indent off
autocmd FileType c,cpp,perl set cindent
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

set backspace=indent,eol,start 
set expandtab
set tabstop=4
set softtabstop=0
set hlsearch
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

"------------------------------------
"Neo Bundle
"------------------------------------


if has('vim_starting')
  set nocompatible
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  "call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite.vim'
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
NeoBundle 'Shougo/neomru.vim'
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
filetype on

NeoBundleCheck

colorscheme jellybeans

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]f   :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r   :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]s   :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]y   :<C-u>Unite -buffer-name=register register<<CR>

nnoremap [vimfiler]    <Nop>
nmap     <Space>f [vimfiler]
nnoremap <silent> [vimfiler]f   :<C-u>VimFiler<CR>
nnoremap <silent> [vimfiler]e   :<C-u>VimFilerExplorer<CR>

" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
" noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
