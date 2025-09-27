call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" Line numbers
set number
set relativenumber

" Enable syntax highlighting
syntax on

" set tabs
set tabstop=3
set shiftwidth=3
set expandtab

" enable mouse
set mouse=a

