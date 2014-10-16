syntax on
set nocompatible

filetype off

" Bundles settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'vim-scripts/Python-Syntax-Folding'
Plugin 'jimenezrick/vimerl'
Plugin 'Shougo/neocomplcache'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
" colorscheme
Plugin 'w0ng/vim-hybrid'

call vundle#end()

filetype plugin indent on


set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
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
set pastetoggle=<F2>
set laststatus=2


" Custom Key bindings

vnoremap > >gv
vnoremap < <gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-l> <C-x><C-o>

nnoremap <F3> :set hlsearch!<CR>

if has("gui_running")
    set guifont=ubuntu\ mono\ 10
    set cursorline
    set colorcolumn=0

    " No menu or toolbar
    set guioptions-=m
    set guioptions-=T
    " No scrollbars
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=b

    set guioptions+=a
endif




set t_Co=256

colorscheme hybrid
" set background=dark
set background=light

set colorcolumn=81
highlight ColorColumn ctermbg=234


let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let NERDTreeIgnore=['\.pyc$', '\.beam$', '\.o$', '\.so$']

let g:vim_markdown_folding_disabled=1

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=2


let g:EclimCompletionMethod='omnifunc'
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns={}
endif
let g:neocomplcache_force_omni_patterns.java='\k\.\k*'


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


autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

autocmd FileType python setlocal completeopt-=preview
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
hi IndentGuideOdd ctermbg=gray
hi IndentGuideEven ctermbg=lightgray

