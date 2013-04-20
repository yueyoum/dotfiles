syntax on
set nocompatible


set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set ignorecase
set showmatch
set matchtime=2
set hlsearch
set incsearch

set ruler 
set number
set numberwidth=5
set nocursorline
set backspace=indent,eol,start
set history=100
set nofoldenable
set ttyfast

set t_Co=256

colorscheme molokai
set background=dark

set colorcolumn=81
highlight ColorColumn ctermbg=234

" statusline

set laststatus=2



" Custom Key bindings

vnoremap > >gv
vnoremap < <gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-e> <Esc><S-a>
inoremap <C-a> <Esc><S-i>
inoremap <C-l> <C-x><C-o>

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>



filetype off

" Bundles settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kevinw/pyflakes-vim'
Bundle 'jimenezrick/vimerl'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'yueyoum/vim-alignment'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'klen/python-mode'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'


filetype plugin indent on

let g:pymode_run=0
let g:pymode_lint=0
let g:pymode_lint_write=0

let g:vim_markdown_folding_disabled=1

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3 

let g:ctrlp_cmd='CtrlP ~/codes'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_depth=10
let g:ctrlp_lazy_update=1
let g:ctrlp_mruf_max=50
let g:ctrlp_mruf_include='\.py$\|\.c$\|\.cpp$\|\.h$\|\.erl$'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|env)$',
    \ 'file': '\v\.(bak|swp|so|pyc|o|beam|dump|gz|bz2|tar)$',
    \}


noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>


autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

