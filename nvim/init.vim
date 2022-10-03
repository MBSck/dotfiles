" GENERAL ------------------------------------------------------------- {{{
" Enable filetype detection. Vim will try to autodetect the file
filetype off

" Load an indent file for the detected filetype
filetype indent on

" Remove issues with backup
set nobackup
set nowritebackup

" Set updatetime so the user experience is better
set updatetime=300

" UTF-8 support
set encoding=utf8

" Spell checking in UK-English
set spell spelllang=en_gb

" Access system keyboard
set clipboard=unnamed

" Set the mapleader
let mapleader=","

" Sets the linters for Ale
let g:ale_linters={'python': ['pylint'],}

" Set autfold for (.vim)-files to level 0
autocmd FileType vim setlocal foldlevel=0

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim config successfully reloaded!"<cr>

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Persistent undo even after you close a file and re-open it
set undofile
"
" Completion behaviour
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window
" }}}

" PLUGINS ------------------------------------------------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')

" Visual Plugins
Plug 'morhetz/gruvbox'					  	  " Better gruvbox Better gruvbox
Plug 'Yggdroot/indentLine'					  " Better visual support for indentation
Plug 'vim-airline/vim-airline'                                    " More support for the powerline
Plug 'vim-airline/vim-airline-themes'                             " Themes for the vim airline
Plug 'nvim-treesitter/nvim-treesitter'       			  " Treesitter parsing support
Plug 'machakann/vim-highlightedyank' 				  " Highlights the code yanking of vim
Plug 'mhinz/vim-startify'					  " A fancy start screen for vim
Plug 'itchyny/vim-highlighturl'					  " URL highlighting in vim
Plug 'yuttie/comfortable-motion.vim'				  " Simulates comfortable scroll motion

" Navigation Plugins
Plug 'preservim/nerdtree'  |					  " File system explorer for vim
Plug 'Xuyuanp/nerdtree-git-plugin' | 		  		  " NERDTree git implementation
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |   		  " NERDTree Syntax highlight
Plug 'ryanoasis/vim-devicons'            			  " Icon support for vim, needs either terminal support for nerd-font or setting it in vimrc (nerd-font install mandatory)
Plug 'junegunn/fzf.vim'                                           " Fuzzy file finder
Plug 'junegunn/fzf', {'do':{ -> fzf#install()}}                   " Updates the FZF

" Vim Utility Plugins
Plug 'bronson/vim-trailing-whitespace'                            " Quickly removes trailing whitespace
Plug 'junegunn/vim-easy-align'                                    " Makes easy align possible

" Linting
Plug 'dense-analysis/ale'					  " Syntax checking/linting for vim

" Code Utility Plugins
Plug 'jiangmiao/auto-pairs' 					  " Autopairs brackets
Plug 'tmhedberg/SimpylFold'                                       " Better folding for coding
Plug 'scrooloose/nerdcommenter' 				  " Autocomment function that is language specific
Plug 'akinsho/toggleterm.nvim', { 'tag' : 'v2.*' } 		  " Makes the term window in nvim toggleable
Plug 'puremourning/vimspector'					  " Debugger for VIM
Plug 'Vimjas/vim-python-pep8-indent'				  " Automatic indent for python Pep8

" File Support Plugins
Plug 'airblade/vim-gitgutter'					  " Git sideline support for vim

call plug#end()
" }}}

" VISUAL ------------------------------------------------------------- {{{
set number  " Shows the numbers of the lines
set showcmd " Show command in bottom bar

" Enable plugins and load plugin for detected filetype
filetype plugin indent on

" Redraw only when we need to, e.g., not with macros
set lazyredraw

" Set truecolorsupport
set termguicolors

" Use dark background
set background=dark

" Set colorscheme
let g:gruvbox_bold=1
let g:gruvbox_italics=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_filetype_hi_groups=0
let g:gruvbox_plugin_hi_groups=0
colorscheme gruvbox

" Set a nerdfont for vim
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Vim-airline theme
let g:airline_theme='angr'

" Ale Airline implementation
let g:airline#extensions#ale#enabled = 1

" Use Airline Fonts
let g:airline_powerline_fonts = 1

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

" Do not show mode on command line since vim-airline can show it
set noshowmode
"
" Show hostname, full path of file and last-mod time on the window title.
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Show buffer number for easier switching between buffer,
let g:airline#extensions#tabline#buffer_nr_show = 1

" Speed up airline
let g:airline_highlighting_cache = 1
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

	" Sets 90 column so line skip can be seen
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

" NERDTree toggle and keep cursor in current window
nnoremap <f3> :NERDTreeToggle<CR>:wincmd p<CR>

" Reveal currently edited file in the NerdTreeWindow
nnoremap <f4> :NerdTreeFind<CR>

" Automatically opens NERDTree when opening vim and moves the cursor to the
" open buffer
autocmd VimEnter * NERDTree | wincmd p

" Automatically close NERDTree if it is last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Show current root as realtive path from HOME in status bar,
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

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
autocmd!
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Shows docstrings for folded code
let g:SimpylFold_docstring_preview=1


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
"}}}

" REMAPS ------------------------------------------------------------- {{{
" Remap the <esc> as well as the new line functionality
inoremap <silent> jj <esc>
nnoremap o o<esc>
nnoremap O O<esc>

" Remap the window resize
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <leader>+ <C-W>>
nnoremap <leader>- <C-W><

" Shortcut for faster save and quit
nnoremap <silent> <leader>w :update<CR>

" Saves the file if modified and quit
nnoremap <silent> <leader>q :x<CR>

" Jump between gitgutter hunks
nnoremap <leader>gn <Plug>(GitGutterNextHunk)
nnoremap <leader>gp <Plug>(GitGutterPrevHunk)

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

" Disable arrow key in vim, see https://goo.gl/s1yfh4.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
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
	direction = 'horizontal',
	persist_size = true,
	close_on_exit = false,
	auto_scroll = true,
	shade_terminals = true,
	}

-- Local variables
local python_package_cmd = "python3 -m "..vim.fn.fnamemodify(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"), ":t").."."..vim.fn.fnamemodify(vim.fn.getcwd(), ":t").."."..vim.fn.expand("%:t:r")

-- Terminal variables
local Terminal = require("toggleterm.terminal").Terminal
local terminal_only = Terminal:new()
local python = Terminal:new({ cmd = "python3 "..vim.fn.expand("%, t") })
local python_package = Terminal:new({ cmd = python_package_cmd })
local pytest = Terminal:new({ cmd = "pytest "..vim.fn.expand("%, t") })
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = { border = "double", },
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("Closing terminal")
	end,
})

-- Create a function to open a neovim terminal in a small split window and run python
function _python_toggle()
	python:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run a python module in a package
function _python_package_toggle()
	python_package:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run pytest
function _pytest_toggle()
	pytest:toggle()
end

-- Simply opens a toggle Terminal
function _lazygit_toggle()
	lazygit:toggle()
end

-- Simply opens a toggle Terminal
function _terminal_toggle()
	terminal_only:toggle()
end

-- Set keymappings for the new commands
vim.api.nvim_set_keymap("n", "<F4>", ":w<CR><cmd>lua _pytest_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F5>", ":w <CR><cmd>lua _python_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><F5>", ":w <CR><cmd>lua _python_package_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F7>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F9>", "<cmd>lua _terminal_toggle()<CR>", {noremap = true, silent = true})
EOF
" }}}

" AUTOCOMPLETION ------------------------------------------------------------- {{{
" WARNING: For this to work "python-language-server[all]" must be pip installed
" }}}
