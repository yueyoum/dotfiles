
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

set ruler 
set number
set numberwidth=5
set nocursorline
set backspace=indent,eol,start
set history=100
set nofoldenable

set t_Co=256


colorscheme molokai
set background=dark


" statusline

set laststatus=2

set statusline=%<
set statusline+=%1*[%t]%*
set statusline+=%2*%w%m%r%*
set statusline+=\ %y
set statusline+=[%{&ff}][%{&fenc}]
set statusline+=%=
set statusline+=%-12(\ %l/%L,%c\ %)%p%%



" Custom Key bindings

inoremap <C-e> <Esc><S-a>
inoremap <C-a> <Esc><S-i>
inoremap <C-l> <C-x><C-o>

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

inoremap ) <C-R>=ClosePairs(')')<CR>
inoremap ] <C-R>=ClosePairs(']')<CR>
inoremap } <C-R>=ClosePairs('}')<CR>


function ClosePairs(char)
    if getline(".")[col(".")-1] == a:char
        return "\<RIGHT>"
    else
        return a:char
    endif
endfunction



filetype off

" Bundles settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" Bundle 'VimEz/CSApprox'
Bundle 'kevinw/pyflakes-vim'
" Bundle 'jimenezrick/vimerl'
" Bundle 'davidhalter/jedi-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'hallison/vim-markdown'
Bundle 'yueyoum/vim-alignment'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'


filetype plugin indent on


let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=1 

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

autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

