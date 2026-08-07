" Minimal GVim setup

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()

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

set background=dark
colorscheme gruvbox

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.git$','__pycache__','\.pyc$']
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'

let mapleader = ' '
let maplocalleader = '\\'
nnoremap <silent> <leader><space> :nohlsearch<CR>
