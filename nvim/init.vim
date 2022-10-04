set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest, list
set cc=80
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast
set colorcolumn=0

call plug#begin("~/.vim/plugged")
    " Plugin section
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'pangloss/vim-javascript'
    Plug 'maxMELLON/vim-jsx-pretty'
    Plug 'sbdchd/neoformat'
call plug#end()

set splitright
set splitbelow
colorscheme vim-monokai-tasty

"ALT+j/k/up/down for moving lines"
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

