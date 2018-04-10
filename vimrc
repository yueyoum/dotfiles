syntax on
set nocompatible

filetype off

" Bundles settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'ten0s/syntaxerl'
Plugin 'justinmk/vim-sneak'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'MattesGroeger/vim-bookmarks'
" colorscheme
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'solarnz/thrift.vim'

call vundle#end()

set t_Co=256
set background=dark
" colorscheme PaperColor
colorscheme gruvbox

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
set completeopt+=longest
" set clipboard=unnamed
set hidden
set cot-=preview

set encoding=utf-8
set fileencoding=utf-8

" Custom Key bindings

map f <Plug>Sneak_s
map F <Plug>Sneak_S

vnoremap > >gv
vnoremap < <gv
vnoremap <C-c> "+y

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <leader>q :bd<CR>

inoremap <C-e> <End>
inoremap <C-a> <Home>

noremap <F1> <Esc>
nnoremap <F3> :set hlsearch!<CR>

" For :CtrlPBuffer
noremap <C-m> :CtrlPBuffer<CR>

let g:airline_theme='gruvbox'
let g:sneak#label = 1
let g:ale_linters = {
            \ 'erlang': ['syntaxerl'],
            \}

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:ycm_global_ycm_extra_conf='/home/wang/.ycm_extra_conf.py'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'

let NERDTreeIgnore=[
            \ '\.pyc$', '\.beam$', '\.o$', '\.so$',
            \'\.a$', '\.bak$', '\.swp$', '\.log$'
            \ ]

let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_start_case=1
let g:neocomplete#enable_auto_select=0
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'erlang': $HOME.'/.vimdictionary'
    \ }


let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_depth=10
let g:ctrlp_lazy_update=1
let g:ctrlp_mruf_max=50
let g:ctrlp_mruf_include='\.py$\|\.c$\|\.cpp$\|\.h$\|\.erl$'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|env)$',
    \ 'file': '\v\.(bak|swp|so|pyc|o|beam|dump|gz|bz2|tar)$',
    \}

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching=0
    let g:ackprg='ag --vimgrep'
endif

" bind K to grep word under cursor or selection
nnoremap K :Ack! <CR>
vnoremap K y:Ack! <C-r>=fnameescape(@")<CR><CR>

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

autocmd FileType c setlocal completeopt-=preview
autocmd FileType cpp setlocal completeopt-=preview
autocmd FileType python setlocal completeopt-=preview

if has("gui_running")
    " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 14
    set guifont=Fira\ Mono\ 11
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

function! s:SetErlangFileHeader()
    let modulename = substitute(expand("%:t"), "\\.erl", "", "")
    call setline(1, "%%% @author: Wang Chao <yueyoum@gmail.com>")
    call setline(2, "%%% @doc")
    call setline(3, "%%%")
    call setline(4, "%%% @end")
    call setline(5, "%%% Date created: ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(6, "")
    call setline(7, "")
    call setline(8, "-module(" . modulename . ").")
    call setline(9, "")
    call setline(10, "-export([start/0]).")
    call setline(11, "")
    call setline(12, "start() ->")
    call setline(13, "    ok.")
    call cursor(13, 1)
endfunc

autocmd BufNewFile *.erl call <SID>SetErlangFileHeader()

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

