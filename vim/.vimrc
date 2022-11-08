" This vim-theme is written for servers and the like, which don't have
" termcolors and maybe an older version of vim (not nvim).

" Tries to enable as much comfort as possible...

" GENERAL ------------------------------------------------------------- {{{
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable filetype detection. Vim will try to autodetect the file
filetype off

" Remove issues with backup
set nobackup
set nowritebackup

" Load an indent file for the detected filetype
filetype indent on

" Set updatetime so the user experience is better
set updatetime=300

" UTF-8 support
set encoding=utf-8

" Access system keyboard
set clipboard=unnamed

" Sets the linters for Ale
let g:ale_linters={'python': ['pylint'],}

" Speed up airline
let g:airline_highlighting_cache = 1

" Set autfold for (.vim)-files to level 0
autocmd FileType vim setlocal foldlevel=0

" Set the mapleader
let mapleader=","

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Spell checking in UK-English
set spell spelllang=en_gb

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Vim config successfully reloaded!"<cr>

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Persistent undo even after you close a file and re-open it
set undofile
" }}}

" PLUGINS ------------------------------------------------------------- {{{
" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Visual Plugins
Plugin 'morhetz/gruvbox' 				    	    " Colorscheme
Plugin 'mhinz/vim-startify'    					    " A fancy start screen for vim
Plugin 'Yggdroot/indentLine' 					    " Better visual support for indentation
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}     " Powerline support
Plugin 'vim-airline/vim-airline'                                    " More support for the powerline
Plugin 'vim-airline/vim-airline-themes'                             " Themes for the vim airline
Plugin 'machakann/vim-highlightedyank' 				    " Highlights the code yanking of vim

" Navigation Plugins
Plugin 'preservim/nerdtree'  |					    " File system explorer for vim
Plugin 'Xuyuanp/nerdtree-git-plugin' | 		  		    " NERDTree git implementation
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' |   		    " NERDTree Syntax highlight
Plugin 'tmhedberg/SimpylFold'                                       " Better folding for coding
Plugin 'junegunn/fzf.vim'                                           " Fuzzy file finder

" Linting
Plugin 'dense-analysis/ale'					    " Syntax checking/linting for vim

" Utility Plugin
Plugin 'airblade/vim-gitgutter'					    " Git sideline support for vim
Plugin 'jiangmiao/auto-pairs' 					    " Autopairs brackets
Plugin 'scrooloose/nerdcommenter' 				    " Autocomment function that is language specific
Plugin 'bronson/vim-trailing-whitespace'                            " Quickly removes trailing whitespace
Plugin 'vim-scripts/indentpython.vim'                               " Indent checks for python
Plugin 'nvie/vim-flake8'                                            " Pep8 support for python

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

" Powerline fonts
let g:airline_powerline_fonts = 1

" Ale Airline implementation
let g:airline#extensions#ale#enabled = 1

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Background color
set background=dark

" Set colorscheme
let g:gruvbox_bold=1
let g:gruvbox_italics=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_filetype_hi_groups=0
let g:gruvbox_plugin_hi_groups=0"
colorscheme gruvbox

" Set a nerdfont for vim
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
	autocmd!
	autocmd WinLeave * set nocursorline nocursorcolumn
	autocmd WinEnter * set cursorline cursorcolumn
augroup END

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" Show buffer number for easier switching between buffer,
let g:airline#extensions#tabline#buffer_nr_show = 1

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

" NERDTree settings
 let g:NERDTreeKeepTreeInNewTab=1
 let g:NERDTreeShowHidden=1

" NERDTree highlighting settings
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Changes the symbols for NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Disable bookmark and 'press ? for help' text
let NERDTreeMinimalUI=1
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
" Shortcut for faster save and quit
 nnoremap <silent> <leader>w :update<CR>

" Saves the file if modified and quit
nnoremap <silent> <leader>q :x<CR>

" Remap the <esc> as well as the new line functionality
inoremap <silent> jj <esc>
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
nnoremap <F2> :FZF<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" NERDTree mappings
nnoremap <F3> :NERDTreeToggle<CR>

" Fix Whitespace mapping
nnoremap <F6> :FixWhitespace<CR>

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
