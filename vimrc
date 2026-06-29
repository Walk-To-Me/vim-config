" ============================================================
" All recommended Vim plugins for Verilog + Python workflow
" ============================================================

call plug#begin('~/.vim/plugged')

" --- General editing -------------------------------------------------
Plug 'tpope/vim-sensible'        " Sensible defaults
Plug 'tpope/vim-surround'        " Bracket/quote/tag manipulation
Plug 'tpope/vim-commentary'      " Quick comment/uncomment
Plug 'tpope/vim-repeat'          " Make . work with plugins
Plug 'tpope/vim-unimpaired'      " Pairs of useful shortcuts
Plug 'wellle/targets.vim'        " Extended text objects
Plug 'tommcdo/vim-exchange'      " Swap two text regions

" --- Motion / navigation --------------------------------------------
Plug 'easymotion/vim-easymotion' " Jump to any visible location
Plug 'rhysd/clever-f.vim'        " Smarter f/F/t/T

" --- File / project navigation --------------------------------------
Plug 'preservim/nerdtree'        " Side file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'          " Fuzzy finder integration

" --- Git ------------------------------------------------------------
Plug 'tpope/vim-fugitive'        " Git commands inside Vim
Plug 'airblade/vim-gitgutter'    " Show git diff markers inline

" --- UI / status / theme --------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'           " Color scheme
Plug 'preservim/vim-polyglot'    " Language syntax packs
Plug 'Yggdroot/indentLine'       " Indent guide lines

" --- Session / undo -------------------------------------------------
Plug 'mbbill/undotree'           " Visual undo tree
Plug 'mhinz/vim-startify'        " Startup dashboard

" --- Verilog / SystemVerilog ----------------------------------------
Plug 'vhda/verilog_systemverilog.vim'

" --- Python ---------------------------------------------------------
Plug 'davidhalter/jedi-vim'      " Python completion / goto / docs
Plug 'psf/black', { 'branch': 'stable' }

" --- Linting / LSP / formatting -------------------------------------
Plug 'dense-analysis/ale'        " Asynchronous lint engine / LSP

" --- Tags / outline -------------------------------------------------
Plug 'ludovicchabant/vim-gutentags' " Auto-managed ctags
Plug 'preservim/tagbar'          " File structure outline

call plug#end()

" ============================================================
" Basic settings
" ============================================================
set nocompatible
set number
set relativenumber
set cursorline
set laststatus=2
set wildmenu
set hidden
set clipboard=unnamedplus
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=5
set signcolumn=yes
set updatetime=300
set timeoutlen=500

" ============================================================
" Theme
" ============================================================
set background=dark
colorscheme gruvbox

" ============================================================
" NERDTree
" ============================================================
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.git$','__pycache__','\.pyc$']
nnoremap <C-n> :NERDTreeToggle<CR>

" Close NERDTree if it is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ============================================================
" fzf.vim
" ============================================================
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>l :Lines<CR>

" ============================================================
" vim-airline
" ============================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'gruvbox'

" ============================================================
" ALE (linting / fixing / LSP)
" ============================================================
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'verilog': ['verilator'],
\   'systemverilog': ['verilator'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 0   " Use jedi-vim for Python completion

nmap <silent> <leader>an <Plug>(ale_next_wrap)
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <leader>ad <Plug>(ale_detail)
nmap <silent> <leader>af <Plug>(ale_fix)

" ============================================================
" jedi-vim (Python)
" ============================================================
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_stubs_command = '<leader>s'
let g:jedi#usages_command = '<leader>n'
let g:jedi#documentation_command = 'K'
let g:jedi#rename_command = '<leader>r'
let g:jedi#popup_on_dot = 1

" ============================================================
" Black (Python formatter)
" ============================================================
let g:black_linelength = 88
let g:black_skip_string_normalization = 0
autocmd BufWritePre *.py execute ':Black'

" ============================================================
" Verilog / SystemVerilog
" ============================================================
let g:verilog_disable_lint_msgs = 1
let g:verilog_syntax_fold = "function,task"

" ============================================================
" Tagbar + gutentags
" ============================================================
nmap <F8> :TagbarToggle<CR>
let g:gutentags_project_root = ['.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_add_default_project_roots = 0

" ============================================================
" undotree
" ============================================================
nnoremap <F5> :UndotreeToggle<CR>

" ============================================================
" vim-gitgutter
" ============================================================
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

" ============================================================
" vim-exchange
" ============================================================
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" ============================================================
" Easymotion
" ============================================================
let g:EasyMotion_do_mapping = 0
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>w <Plug>(easymotion-overwin-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)

" ============================================================
" clever-f
" ============================================================
let g:clever_f_across_no_line = 0
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 0
let g:clever_f_fix_key_direction = 1

" ============================================================
" indentLine
" ============================================================
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree', 'tagbar']

" ============================================================
" Leader key
" ============================================================
let mapleader = ' '               " Use space as leader
let maplocalleader = '\\'

" ============================================================
" Quick shortcut: clear search highlight
" ============================================================
nnoremap <silent> <leader><space> :nohlsearch<CR>
