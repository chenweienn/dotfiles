"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
" set foldcolumn=1

" Keep lots of history/undo
set undolevels=1000

" Make backspace work
" https://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Show hidden characters, tabs, trailing whitespace
" set list
" set listchars=tab:→\ ,trail:·,nbsp:·

" Different tab/space stops"
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" autocmd Filetype java setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab makeprg=javac\ % efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" autocmd Filetype java setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab makeprg=javac\ % efm=%A%f:%l:\ %m,%+Z%p^,%+C%.%#,%-G%.%#
autocmd Filetype java setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab makeprg=javac\ % 
" autocmd Filetype java setlocal makeprg=javac\ %
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Be smart when using tabs ;)
set smarttab

" Set folding
" set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable the use of mouse
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mouse'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keep original code indentation when paste from other application
" https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set paste     <<   becuase this breaks code completion of CoC


" for split better
set splitbelow
set splitright

source ~/.vim/plugins.vim
