" GENERAL ------------------------------------------------------------- {{{
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable filetype detection. Vim will try to autodetect the file
filetype off

" Load an indent file for the detected filetype
filetype indent on

" UTF-8 support
set encoding=utf-8

" Access system keyboard
set clipboard=unnamed

" Set the mapleader
let mapleader=","

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" Makes autocomplete window go away after completion
let g:ycm_autoclose_preview_window_after_completion=1

" Spell checking in UK-English
set spell spelllang=en_gb
" }}}

" PLUGINS ------------------------------------------------------------- {{{
" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins need to be added here
Plugin 'ayu-theme/ayu-vim'                                          " Ayu colorscheme for vim
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}     " Powerline
Plugin 'vim-airline/vim-airline'                                    " More support for the powerline
Plugin 'vim-airline/vim-airline-themes'                             " Themes for the vim airline
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}       " Treesitter parsing support for python

Plugin 'preservim/nerdtree'                                         " File system explorer for vim

Plugin 'tpope/vim-fugitive'                                         " Git support for vim
Plugin 'cespare/vim-toml'                                           " Toml support for vim

Plugin 'Valloric/YouCompleteMe'                                     " Autocomplete for many languages
Plugin 'ervandew/supertab'                                          " Makes <Tab> do inserting
Plugin 'dense-analysis/ale'                                         " Syntax checker various languages
Plugin 'tmhedberg/SimpylFold'                                       " Better folding for coding
Plugin 'junegunn/vim-easy-align'                                    " Makes easy align possible
Plugin 'junegunn/fzf.vim'                                           " Fuzzy file finder
Plugin 'junegunn/fzf', {'do':{ -> fzf#install()}}                   " Updates the FZF
Plugin 'bronson/vim-trailing-whitespace'                            " Quickly removes trailing whitespace
Plugin 'LucHermitte/vim-refactor'                                   " Refactoring for programming languages

Plugin 'vim-scripts/indentpython.vim'                               " Indent checks for python
Plugin 'nvie/vim-flake8'                                            " Pep8 support for python

" Plugin 'sheerun/vim-polyglot'                                       " Language support for vim, syntax support

Plugin 'vim-scripts/a.vim'                                          " Switches quickly between files and headers
Plugin 'vim-scripts/argtextobj.vim'                                 " Provides text-object a argument

" Calls the plugins
call vundle#end()
" }}}

" VISUAL ------------------------------------------------------------- {{{
set number  " Shows the line numbers
set showcmd " Show command in bottom bar

" Enable plugins and load plugin for detected filetype
filetype plugin indent on

set lazyredraw  " Redraw only when we need to, e.g., not with macros
set showmatch   " Highlight matching [{()}]

" Set truecolorsupport
set termguicolors

" Powerline fonts
let g:airline_powerline_fonts = 1

" Enable dark version
let ayucolor='dark'

" Set colorscheme
colorscheme ayu

" Highlight cursor
set cursorline      " Highlights current line
set cursorcolumn    " Highlights current column

" Sets 80 column so line skip can be seen
if (exists('+colorcolumn'))
set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Python
let python_highlight_all=1

" Turn on syntax highlighting
syntax on
" }}}

" SEARCH ------------------------------------------------------------- {{{
set hlsearch    " Highlight all search results
set ignorecase  " Do case insensitive search
set incsearch   " Show incremental search results as you type
set noswapfile  " Disables the swap file
set smartcase

" Turn of the search highlight
nnoremap <leader><space> :nohlsearch<CR>

set history=1000
" }}}

" PYTHON ------------------------------------------------------------- {{{
" Run python script in Vim. <CR> (carriage return), :!clear, clears screen
" command
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" Python tab-setting for vim
augroup python
    autocmd!
    autocmd Filetype python setlocal tabstop=4       " Number of visual spaces per TAB
    autocmd Filetype python setlocal softtabstop=4   " Number of spaces in tab when editing
    autocmd Filetype python setlocal shiftwidth=4
    autocmd Filetype python setlocal textwidth=90    " Pep8-linelimit, set to 90 (even though Pep8 would be 79)
    autocmd Filetype python setlocal smarttab
    autocmd Filetype python setlocal expandtab       " TABs are set to be 4 spaces, TABs are spaces
    autocmd Filetype python setlocal autoindent
    autocmd Filetype python setlocal fileformat=unix
augroup END
" }}}

" FILE EXPLORERS------------------------------------------------------------- {{{
" Enable autocompleting after pressing tab for wildmenu"
set wildmenu

" Make wildmenu behave like Bash
set wildmode=list:longest

" Make wildmenu ignore files not meant for vim editing
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,.xlsx

" Let NERDtree ignore certain files and directories
let NERDTreeIgnore=['\.git$','\.jpg$','\.mp4$','\.ogg$','\.iso$','\.pdf$','\.pyc$','\.odt$','\.png$','\.gif$','\.db$']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}

" NAVIGATION ------------------------------------------------------------- {{{
" This will enable code folding with the marker method
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

" Enable code folding
set foldmethod=indent
set foldlevelstart=10   " Opens most fold by default
set foldlevel=99
set foldnestmax=10      " 10 nested fold max shown from start

" Enable folding with spacebar
nnoremap <space> za

" General Layout for splitting
set splitbelow
set splitright

" This makes the line numbers be relative when in command mode and fixed, when in
" insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Shows docstrings for folded code
let g:SimpylFold_docstring_preview=1

"}}}

" REMAPS ------------------------------------------------------------- {{{
inoremap jj <esc>
nnoremap o o<esc>
nnoremap O O<esc>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Yank from cursor to the end of line
nnoremap Y y$

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF mapping
nnoremap <f2> :FZF<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" NERDTree mappings
nnoremap <f3> :NERDTreeToggle<CR>

" Fix Whitespace mapping
nnoremap <F6> :FixWhitespace<CR>

" YouCompleteMe mapping for goto definition
map <leader>g :YouCompleter GoToDefinitionElseDeclaration<CR>

" Easier tab handling
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>t<leader> :tabnext
nnoremap <leader>tm :tabmove
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>

" Remaps for tab switching
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>6 6gt<CR>
nnoremap <leader>7 7gt<CR>
nnoremap <leader>8 8gt<CR>
nnoremap <leader>9 9gt<CR>
nnoremap <leader>0 :tablast<cr>

" Fast tab switching
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>

" Remaps for buffer switching
nnoremap <leader>b1 :buffer1<CR>
nnoremap <leader>b2 :buffer2<CR>
nnoremap <leader>b3 :buffer3<CR>
nnoremap <leader>b4 :buffer4<CR>
nnoremap <leader>b5 :buffer5<CR>
nnoremap <leader>b6 :buffer6<CR>
nnoremap <leader>b7 :buffer7<CR>
nnoremap <leader>b8 :buffer8<CR>
nnoremap <leader>b9 :buffer9<CR>

" Fast buffer switching
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
" }}}

" VIMSCRIPTS ------------------------------------------------------------- {{{
" Adds virtulenv support for python
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
" }}}

" STATUS LINE ------------------------------------------------------------- {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}
