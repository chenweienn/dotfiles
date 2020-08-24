"Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" code completion
" deoplete.nvim from https://github.com/Shougo/deoplete.nvim
" prequisition: python3 -m pip install pynvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Disable deoplete because it blocks CoC
let g:deoplete#enable_at_startup = 0
" Less spam , deprecated
" let g:deoplete#auto_complete_start_length = 2
" Use smartcase, deprecated, check :help deoplete-options
" let g:deoplete#enable_smart_case = 1
set runtimepath+=~/.vim/plugged/deoplete.nvim
" call deoplete#custom#option('smart_case', v:true)
" Setup completion sources, deprecated
" let g:deoplete#sources = {}
" IMPORTANT: PLEASE INSTALL JAVACOMPLETE2  AND ULTISNIPS OR DONT ADD THIS LINE!
" =====================================
" let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']
" =====================================

" java completion
" Plug 'junegunn/vim-javacomplete2' " the repo not existing

" CoC for completion
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors)
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'
" https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1

" A light and configurable statusline/tabline plugin for Vim
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \  'colorscheme': 'selenized_dark',
      \ }
set laststatus=2
set noshowmode

" NerdTree
Plug 'preservim/nerdtree'
" Toggle nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>
" Open when no files were speficied on vim launch
" https://github.com/preservim/nerdtree#how-can-i-open-a-nerdtree-automatically-when-vim-starts-up-if-no-files-were-specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Initialize plugin system
call plug#end()
