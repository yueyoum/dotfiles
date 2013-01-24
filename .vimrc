
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

set ruler 
set number
set nocursorline
set backspace=indent,eol,start
""set nowrap
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
inoremap <C-l> <C-x><C-o>

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

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

" vundle self, required
Bundle 'gmarik/vundle'
" Try to support GVIM colorscheme in VIM
Bundle 'VimEz/CSApprox'
" For programming Python
Bundle 'kevinw/pyflakes-vim'
" For programming Erlang
""Bundle 'jimenezrick/vimerl'
" Autocomplete
Bundle 'Shougo/neocomplcache'
" Tasklist
Bundle 'vim-scripts/TaskList.vim'
" Syntax highligh of markdown
Bundle 'hallison/vim-markdown'
" vim-ruby
""Bundle 'vim-ruby/vim-ruby'
" powerful python autocomplete
""Bundle 'davidhalter/jedi-vim'


filetype plugin indent on


let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=1 

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1


autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

