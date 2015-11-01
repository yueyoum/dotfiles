syntax on
set nocompatible

filetype off

" Bundles settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kevinw/pyflakes-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jimenezrick/vimerl'
Plugin 'Shougo/neocomplete'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'pangloss/vim-javascript'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
" colorscheme
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()


set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set cindent
" set ignorecase
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

set encoding=utf-8
set fileencoding=utf-8


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


set t_Co=256

" colorscheme jellybeans
colorscheme molokai
set background=dark

set colorcolumn=81
highlight ColorColumn ctermbg=234

let g:airline_powerline_fonts=1

let NERDTreeIgnore=['\.pyc$', '\.beam$', '\.o$', '\.so$', '\.bak$', '\.swp$']

let g:syntastic_cpp_compiler_options=' -std=c++11'

let g:vim_markdown_folding_disabled=1

let g:cpp_class_scope_highlight=1

let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_start_case=1
let g:neocomplete#sources#syntax#min_keyword_length=2


" let g:ctrlp_cmd='CtrlP ~/codes'
let g:ctrlp_working_path_mode='cra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_depth=10
let g:ctrlp_lazy_update=1
let g:ctrlp_mruf_max=50
let g:ctrlp_mruf_include='\.py$\|\.c$\|\.cpp$\|\.h$\|\.erl$'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|env)$',
    \ 'file': '\v\.(bak|swp|so|pyc|o|beam|dump|gz|bz2|tar)$',
    \}

" For :CtrlPBuffer
noremap <c-m> :CtrlPBuffer<CR>


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



if has("gui_running")
    set guifont=Ubuntu\ Mono\ 12
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
    set mousemodel=popup

    " colorscheme molokai

    " paste via Crtl+Shift+V
    " nnoremap <silent> <c-s-v> "+gP
    " inoremap <silent> <c-s-v> <Esc><Right>"+gPi
endif


" Automatic remove trailing whitespaces

autocmd FileType c,cpp,java,php,ruby,python,erlang,go,rust,sql,sh,html,css,vim autocmd BufWritePre <buffer> :%s/\s\+$//e


" Automatic Insert/Update Header When File Create/Write

autocmd BufNewFile *.py
    \ exe "normal O" .
    \ "\# -*- coding: utf-8 -*-\n" .
    \ "\"\"\"\"\n" .
    \ "Author:        Wang Chao <yueyoum@gmail.com>\n" .
    \ "Filename:      " . expand('%:t') . "\n" .
    \ "Date created:  " . strftime("%Y-%m-%d %H:%M:%S") . "\n" .
    \ "Description: \n\n" .
    \ "\"\"\"\"\n"

filetype plugin indent on

