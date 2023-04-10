set nocompatible
syntax on
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
set relativenumber

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

set textwidth=80
set rtp+=/usr/local/opt/fzf
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

let NERDTreeQuitOnOpen = 1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set termguicolors
set background=dark
colorscheme molokai
let g:airline_powerline_fonts = 1

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'preservim/nerdcommenter'
  Plug 'dense-analysis/ale'
  Plug 'lifepillar/vim-mucomplete'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
call plug#end()

nnoremap <C-p> :Files<CR>

let g:ale_completion_enabled=1
let g:ale_linters = {
\ 'php': ['intelephense']
\}

function SetAleLSPShortcuts()
  nnoremap <leader>ld :ALEGoToDefinition<CR>
  nnoremap <leader>lt :ALEGoToTypeDefinition<CR>
  nnoremap <leader>lx :ALEFindReferences<CR>
  nnoremap <leader>li :ALEImport<CR>
  nnoremap <leader>ll :ALEGoToImplementation<CR>
  nnoremap <leader>lh :ALEHover<CR>
  nnoremap <leader>lc :ALEComplete<CR>
  nnoremap <leader>lr :ALERename<CR>
endfunction()

call SetAleLSPShortcuts()
