syntax on
set nocompatible

filetype off

" Bundles settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jimenezrick/vimerl'
" Plugin 'Shougo/neocomplete'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/fontzoom.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
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
set foldenable
set foldmethod=indent
set foldlevel=3

set encoding=utf-8
set fileencoding=utf-8

set dictionary+=~/.vimdictionary

" Custom Key bindings

vnoremap > >gv
vnoremap < <gv
vnoremap <C-c> "+y

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-l> <C-x><C-k>
inoremap <C-e> <End>
inoremap <C-a> <Home>

" Jump to previous/last edit location
nnoremap <S-Left> g;
nnoremap <S-Right> g,

noremap <F1> <Esc>
nnoremap <F3> :set hlsearch!<CR>

" For :CtrlPBuffer
noremap <c-m> :CtrlPBuffer<CR>

" For YouCompleteMe
noremap <S-d> :YcmCompleter GoToDefinition<CR>
noremap <S-l> :YcmCompleter GoToDeclaration<CR>
noremap <S-t> :YcmCompleter GetType<CR>
noremap <S-w> :YcmCompleter GetDoc<CR>

set t_Co=256

" colorscheme jellybeans
colorscheme Tomorrow-Night-Bright

set colorcolumn=81
highlight ColorColumn ctermbg=234

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let g:airline_powerline_fonts=1

let NERDTreeIgnore=['\.pyc$', '\.beam$', '\.o$', '\.so$', '\.a$', '\.bak$', '\.swp$', '\.log$']

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

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

autocmd FileType c setlocal completeopt-=preview
autocmd FileType cpp setlocal completeopt-=preview
autocmd FileType python setlocal completeopt-=preview
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2


if has("gui_running")
    " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 14
    set guifont=Hack\ Regular\ 13
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

    " colorscheme Tomorrow

    " paste via Crtl+Shift+V
    " nnoremap <silent> <c-s-v> "+gP
    " inoremap <silent> <c-s-v> <Esc><Right>"+gPi
endif


" Automatic remove trailing whitespaces

autocmd FileType c,cpp,java,php,ruby,python,erlang,go,rust,sql,sh,html,css,vim autocmd BufWritePre <buffer> :%s/\s\+$//e


" Automatic Insert/Update Header When File Create/Write

function! s:SetPythonFileHeader()
    call setline(1, "\# -*- coding: utf-8 -*-")
    call setline(2, "")
    call setline(3, "\"\"\"")
    call setline(4, "Author:        Wang Chao <yueyoum@gmail.com>")
    call setline(5, "Filename:      ".expand("%:t"))
    call setline(6, "Date created:  ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(7, "Description:   ")
    call setline(8, "")
    call setline(9, "\"\"\"")
    call setline(10, "")
    call setline(11, "")
    call cursor(11, 1)
endfunc

autocmd BufNewFile *.py call <SID>SetPythonFileHeader()

function! s:SetCHeaderFileHeader()
    let filename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    let headername = "__" . filename . "__"
    call setline(1, "\#ifndef " . headername)
    call setline(2, "\#define " . headername)
    call setline(3, "")
    call setline(4, "")
    call setline(5, "")
    call setline(6, "\#endif // " . headername)
    call cursor(4, 1)
endfunc

autocmd BufNewFile *.{h,hpp} call <SID>SetCHeaderFileHeader()

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

