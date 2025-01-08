colorscheme Tomorrow-Night-Eighties

" Turn off strict Vi compatibility.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Whitespace features
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set noeol
set autoindent

" set nowrap            " sometimes I prefer no wrap
set linebreak           " do not wrap text in the middle of a word

" Display line numbers and rulers.
set number
set ruler
syntax on

" Status bar
set laststatus=2

" Swap and backup
set nobackup
set noswapfile

" Misc
set encoding=utf-8
set t_Co=256            " Use 256 colors
set clipboard=unnamed   " Use the system clipboard
set mouse=a             " In many terminal emulators the mouse works just fine, thus enable it.

set history=50		      " keep 50 lines of command line history
set showcmd		          " display incomplete commands
set visualbell          " No sounds

" Search
set incsearch		        " do incremental searching as you type
set ignorecase          " ignore case when pattern matching
set smartcase           " check case when uppercase are used
set hlsearch            " highlight search results

set showmatch           " Flash matching brackets

" Spell checking. configure the language and turn off spell checking.
set spell spelllang=en_ca
set nospell

" Remember last position in file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


" File types
filetype indent plugin on

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

" Trim whitespace
:command Trim :call TrimWhiteSpace()

autocmd BufWritePre * :call TrimWhiteSpace()
"autocmd FileType yaml,python,java autocmd BufWritePre    * :call TrimWhiteSpace()


" python
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab colorcolumn=79

" make uses real tabs
au FileType make setl noexpandtab

" Highlight JSON & es6 like Javascript
au BufNewFile,BufRead {*.json,*.es6} set ft=javascript

" markdown settings
au FileType markdown setl textwidth=80 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=80

" Lektor uses custom file types, but markdown contents.
au BufNewFile,BufRead {*.lr} set ft=markdown
