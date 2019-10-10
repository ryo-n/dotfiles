syntax on
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
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set t_Co=256
set history=200
set pastetoggle=<f5>
set mouse-=a
set noswapfile
set nobackup

"Python3 support
"let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'


cnoremap <expr> %% getcmdtype() == ’:’ ? expand(’%:h’).’/’ : ’%%’

let mapleader = ","

" -------------------------------
" vim-plug
" -------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-quickrun'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()



" -------------------------------
" color
" -------------------------------
colorscheme jellybeans

" -------------------------------
" fzf
" -------------------------------

nnoremap [unite]    <Nop>
nmap     <C-u> [unite]

nnoremap <silent> [unite]f   :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]<C-d>   :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]<C-g>   :<C-u>GFiles<CR>
nnoremap <silent> [unite]w   :<C-u>UniteWithCursorWord grep/git:/:<CR>
nnoremap <silent> [unite]<C-b>   :<C-u>Buffers<CR>
nnoremap <silent> [unite]<C-r>   :<C-u>Rg 
nnoremap <silent> [unite]s   :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]y   :<C-u>Unite -buffer-name=register register<<CR>


"------------------------------------
" vim-airline
"------------------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'


"------------------------------------
" tmuxline
"------------------------------------
let g:airline#extensions#tmuxline#enabled = 0 
