" GENERAL ------------------------------------------------------------- {{{
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

" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" Makes autocomplete window go away after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Autocomplete cycle through with <tab>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Spell checking in UK-English
set spell spelllang=en_gb

" Enable autocomplete of deoplete
let g:deoplete#enable_at_startup = 1

" Set code linter/syntax checker for languages
let g:neomake_python_enabled_makers = ['pylint']
" }}}

" PLUGINS ------------------------------------------------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')

" Plugins need to be added here
Plug 'morhetz/gruvbox' 						  " Colorscheme for vim
Plug 'vim-airline/vim-airline'                                    " More support for the powerline
Plug 'vim-airline/vim-airline-themes'                             " Themes for the vim airline
Plug 'Yggdroot/indentLine'					  " Better visual support for indentation
Plug 'nvim-treesitter/nvim-treesitter'       			  " Treesitter parsing support
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'} 		  " Makes the term window in nvim toggleable

Plug 'preservim/nerdtree'                                         " File system explorer for vim
Plug 'junegunn/fzf.vim'                                           " Fuzzy file finder
Plug 'junegunn/fzf', {'do':{ -> fzf#install()}}                   " Updates the FZF

Plug 'tpope/vim-fugitive'                                         " Git support for vim
Plug 'cespare/vim-toml'                                           " Toml support for vim

Plug 'bronson/vim-trailing-whitespace'                            " Quickly removes trailing whitespace
Plug 'junegunn/vim-easy-align'                                    " Makes easy align possible
Plug 'neomake/neomake' 						  " Syntax checker for code (languages need to be installed)

Plug 'vim-scripts/indentpython.vim'                               " Indent checks for python
Plug 'nvie/vim-flake8'                                            " Pep8 support for python
Plug 'zchee/deoplete-jedi'					  " Deoplete plugin for python

Plug 'tmhedberg/SimpylFold'                                       " Better folding for coding
Plug 'davidhalter/jedi-vim' 					  " Jump to class or function definitions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	  " Autocomplete for multiple languages (need to be installed)

Plug 'sbdchd/neoformat' 					  " Autoformats the source code, language specific
Plug 'jiangmiao/auto-pairs' 					  " Autopairs brackets
Plug 'scrooloose/nerdcommenter' 				  " Autocomment function that is language specific

Plug 'machakann/vim-highlightedyank' 				  " Highlights the code yanking of vim

" Calls the plugins
call plug#end()
" }}}

" VISUAL ------------------------------------------------------------- {{{
set number  " Shows the line numbers
set showcmd " Show command in bottom bar

" Enable plugins and load plugin for detected filetype
filetype plugin indent on

" Redraw only when we need to, e.g., not with macros
set lazyredraw

" Set truecolorsupport
set termguicolors

" Set colorscheme
colorscheme gruvbox

" Vim-airline theme
let g:airline_theme='angr'

" Add powerline support to airline
let g:airline_powerline_fonts=1

" Highlight cursor
set cursorline      " Highlights current line
set cursorcolumn    " Highlights current column

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
	autocmd!
	autocmd WinLeave * set nocursorline nocursorcolumn
	autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Highlights code yanking for vim
hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000
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
" Python tab-setting for vim
augroup filetype_python
	autocmd!
	autocmd Filetype python setlocal tabstop=4
	autocmd Filetype python setlocal softtabstop=4
	autocmd Filetype python setlocal shiftwidth=4
	autocmd Filetype python setlocal textwidth=90
	autocmd Filetype python setlocal smarttab
	autocmd Filetype python setlocal expandtab
	autocmd Filetype python setlocal autoindent
	autocmd Filetype python setlocal fileformat=unix

	" Sets 80 column so line skip can be seen
	if (exists('+colorcolumn'))
		set colorcolumn=90
		highlight ColorColumn ctermbg=9
	endif

augroup END

" Python paths for nvim support
let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app/Contents/MacOS/Python'
let g:python3_host_prog = '/usr/local/bin/python3.10'

" }}}

" CFG ------------------------------------------------------------- {{{
" Settings for (.cfg/.ini)-files
augroup filetype_cfg
	autocmd Filetype cfg setlocal tabstop=2
	autocmd Filetype cfg setlocal softtabstop=4
	autocmd Filetype cfg setlocal shiftwidth=4
	autocmd Filetype cfg setlocal smarttab
	autocmd Filetype cfg setlocal expandtab
	autocmd Filetype cfg setlocal autoindent
	autocmd Filetype cfg setlocal fileformat=unix
augroup end

augroup filetype_ini
	autocmd Filetype cfg setlocal tabstop=2
	autocmd Filetype cfg setlocal softtabstop=4
	autocmd Filetype cfg setlocal shiftwidth=4
	autocmd Filetype cfg setlocal smarttab
	autocmd Filetype cfg setlocal expandtab
	autocmd Filetype cfg setlocal autoindent
	autocmd Filetype cfg setlocal fileformat=unix
augroup end
" }}}

" FILE EXPLORERS/NerdTree/Wildmenu------------------------------------------------------------- {{{
" Enable autocompleting after pressing tab for wildmenu"
set wildmenu

" Make wildmenu behave like Bash
set wildmode=list:longest

" Make wildmenu ignore files not meant for vim editing
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,.xlsx

" Let NERDtree ignore certain files and directories
let NERDTreeIgnore=['\.git$','\.jpg$','\.mp4$','\.ogg$','\.iso$','\.pdf$','\.pyc$','\.odt$','\.png$','\.gif$','\.db$']

" NERDTree mappings
nnoremap <f3> :NERDTreeToggle<CR>

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
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
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

" TREESITTER ------------------------------------------------------------- {{{
" Enable treesitter language recognition
lua << EOF
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "python", "lua", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
		},
	}
EOF
" }}}

" TERMINAL ------------------------------------------------------------- {{{
" Setup toggleterm in lua
lua << EOF
require("toggleterm").setup {
	start_in_insert = true,
	insert_mappings = true,
	direction = 'vertical',
	}

-- Variables
local Terminal = require("toggleterm.terminal").Terminal
local python = Terminal:new({ cmd = "python3 %" })
local pytest = Terminal:new({ cmd = "pytest %" })

-- Create a function to open a neovim terminal in a small split window and run python
function _python_toggle()
	python:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run pytest
function _pytest_toggle()
	pytest:toggle()
end

-- Set keymappings for the new commands
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua _pytest_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua _python_toggle()<CR>", {noremap = true, silent = true})
EOF
" }}}
