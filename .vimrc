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
"set t_Co=256
set history=200
set pastetoggle=<f5>
set mouse-=a

"Python3 support
let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'


cnoremap <expr> %% getcmdtype() == ’:’ ? expand(’%:h’).’/’ : ’%%’

"------------------------------------
"Neo Bundle
"------------------------------------


if has('vim_starting')
"	set nocompatible
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
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'alpaca-tc/alpaca_powertabline'
if has('nvim')
    NeoBundleLazy 'Shougo/deoplete.nvim', {
          \ "autoload": {"insert": 1}}
else
    NeoBundleLazy 'Shougo/neocomplete.vim', {
          \ "autoload": {"insert": 1}}
endif
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundleCheck

call neobundle#end()

filetype plugin indent on
filetype on

runtime macros/matchit.vim

NeoBundleCheck

colorscheme jellybeans

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec/'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" deoplete and neocomplete.vim
" --------------------------------
if has('nvim')
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_at_smart_case = 1
else
	let g:acp_enableAtStartup = 0
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
endif



" --------------------------------
" rubocop
" --------------------------------
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']


"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]f   :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]d   :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]g   :<C-u>Unite grep/git:/:<CR>
nnoremap <silent> [unite]w   :<C-u>UniteWithCursorWord grep/git:/:<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r   :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]s   :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]y   :<C-u>Unite -buffer-name=register register<<CR>

" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧
noremap <C-U><C-D> :Unite file_rec/async:!<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" grep git
noremap <C-U><C-G> :Unite grep/git:/:<CR>
" カーソル上の単語をgrep git
noremap <C-U><C-W> :UniteWithCursorWord grep/git:/:<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

if executable('hw')
	" Use hw (highway)
	" https://github.com/tkengo/highway
	let g:unite_source_grep_command = 'hw'
	let g:unite_source_grep_default_opts = '--no-group --no-color'
	let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
	" Use pt (the platinum searcher)
	" https://github.com/monochromegane/the_platinum_searcher
	let g:unite_source_grep_command = 'pt'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor'
	let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------
" vimfiler
"------------------------------------
nnoremap [vimfiler]    <Nop>
nmap     <Space>f [vimfiler]
nnoremap <silent> [vimfiler]f   :<C-u>VimFiler<CR>
nnoremap <silent> [vimfiler]e   :<C-u>VimFilerExplorer<CR>

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
