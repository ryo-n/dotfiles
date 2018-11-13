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
set fencs=iso-2022-jp,euc-jp,cp932,utf-8
set t_Co=256
set history=200
set pastetoggle=<f5>
set mouse-=a
set noswapfile
set nobackup

"Python3 support
"let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'


cnoremap <expr> %% getcmdtype() == ’:’ ? expand(’%:h’).’/’ : ’%%’

" -------------------------------
" vim-plug
" -------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



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
