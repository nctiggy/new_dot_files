" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'pearofducks/ansible-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'plasticboy/vim-markdown'
Plug 'PProvost/vim-ps1'

call plug#end()

syntax enable
filetype plugin indent on
let mapleader=","

colorscheme dracula

set tabstop=4
set softtabstop=4
set expandtab

set number
set showcmd
set noswapfile

set cursorline
set showmatch

set incsearch
set hlsearch

set lazyredraw

let g:terraform_fold_sections=1
let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
let g:ansible_name_highlight = 'b'
let g:ansible_unindent_after_newline = 1

nnoremap <leader><space> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <F7> :call Flake8()<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set nowrap

let g:pymode_python = 'python3'
set list listchars=trail:.,extends:>
let g:airline_symbols = {}
let g:airline_symbols.maxlinenr = ''

let vim_markdown_preview_use_xdg_open=1

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileWritePre * call TrimWhiteSpace()
    autocmd FileAppendPre * call TrimWhiteSpace()
    autocmd FilterWritePre * call TrimWhiteSpace()
    autocmd BufWritePre * call TrimWhiteSpace()
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType javascript setlocal tabstop=4
    autocmd FileType javascript setlocal shiftwidth=4
    autocmd FileType javascript setlocal softtabstop=4
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*#'
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter *.tmpl setlocal filetype=yml
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
