" A

" vim-plug {{{

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" }}}
" Settings {{{

set nocompatible            " Don't try to be vi compatible

set nobackup                " No backup files
set nowritebackup           " No write backup
set noswapfile              " No swap file

set ruler                   " Always show cursor

set hidden                  " A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
                            " if you try and quit Vim while there are hidden buffers, you will raise an error:
                            " E162: No write since last change for buffer “a.txt”

set history=100             " remember more commands and search history

set visualbell t_vb=        " Ensure Vim doesn't beep at you every time you make a mistype
set noerrorbells            " don't beep

set mouse=a                 " mouse scroll

set autoread                " Autoload files that have changed outside of vim

set clipboard=unnamedplus   " Alias unnamed register to the + register, which is the X Window clipboard

autocmd BufWritePre * :%s/\s\+$//e      " remove whitespaces on save

" }}}
" Spaces & Tabs {{{

set backspace=indent,eol,start      " Allow backspace to delete end of line, indent and start of line characters

set nowrap                          " Turn word wrap off

filetype indent on
set smartindent
set autoindent
set expandtab                       " Convert tabs to spaces
set tabstop=4			            " Set tab size in spaces (this is for manual indenting)
set shiftwidth=4                    " The number of spaces inserted for a tab (used for auto indenting)
set softtabstop=4		            " number of spaces in tab when editing

" }}}
" UI {{{

set t_Co=256
syntax enable                   " enable syntax processing
syntax on
set background=dark
"colorscheme solarized

set laststatus=2                " Always show status bar

"set number                     " Turn on line numbers
set showcmd                     " show command in bottom bar
"set cursorline                 " highlight current line
set wildmenu                    " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
"set lazyredraw                 " redraw only when we need to (i.e. don't redraw when executing a macro)
set showmatch                   " highlight a matching [{()}] when cursor is placed on start/end character

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=80

" }}}
" Searching {{{

set ignorecase
set smartcase

set incsearch           " Incremental searching (search as you type)
set hlsearch            " highlight matches

nnoremap <leader><space> :nohlsearch<CR>

" }}}
" Folding {{{

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za     " space open/closes folds
set foldmethod=indent   " fold based on indent level

" }}}
" Mappings {{{

"let mapleader=","       " leader is comma

" Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" move line
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

" cycle through open buffers
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Left> :bp<CR>

" }}}
" NEDRTree {{{

"Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle display
map <C-n> :NERDTreeToggle<CR>

" Hit the right arrow to open a node
let NERDTreeMapActivateNode='<space>'

" Display hidden files
let NERDTreeShowHidden=100

"
let NERDTreeIgnore = []

" Locate the focused file in the tree
nmap <leader>j :NERDTreeFind<CR>

" Do not display some useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" }}}
" lightline {{{
" }}}
" fzf {{{

" Key binding
map <C-p> :FZF<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>


" }}}

" vim:foldmethod=marker:foldlevel=0
