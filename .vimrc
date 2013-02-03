colorscheme Tomorrow-Night

set nocompatible        " Turn off struct Vi compatibility.

set backspace=indent,eol,start
                        " allow backspacing over everything in insert mode
set linebreak           " causes vim to not wrap text in the middle of a word
set tabstop=4
set shiftwidth=4
set nowrap

set nobackup		    " do not keep a backup file
set noswapfile
set history=50		    " keep 50 lines of command line history
set ruler		        " show the cursor position all the time
set showcmd		        " display incomplete commands
"set number             " Show lines numbers

set incsearch		    " do incremental searching as you type
set ignorecase          " ignore case when pattern matching
set smartcase           " check case when uppercase are used
set hlsearch            " highlight search results

set spell

set mouse=a             " In many terminal emulators the mouse works just fine, thus enable it.

" Remember last position in file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

syntax on               
set showmatch           " Flash matching brackets

filetype indent plugin on
au FileType python setlocal expandtab softtabstop=4
