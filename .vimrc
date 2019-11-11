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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

nnoremap [fzf]    <Nop>
nmap     <C-u> [fzf]

nnoremap <silent> [fzf]<C-d>   :<C-u>Files<CR>
nnoremap <silent> [fzf]<C-g>   :<C-u>GFiles<CR>
nnoremap <silent> [fzf]<C-b>   :<C-u>Buffers<CR>
nnoremap <silent> [fzf]<C-r>   :<C-u>Rg 


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

"------------------------------------
" coc.nvim
"------------------------------------
set updatetime=300

set hidden
" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

