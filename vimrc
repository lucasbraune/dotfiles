" Comment

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down. Disable with `set norelativenumber` or `set nornu`.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

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
"let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

set runtimepath+=~/.vim-plugins/LanguageClient-neovim
"let g:LanguageClient_serverCommands = {
"    \ 'php': ['node', '/usr/local/lib/node_modules/intelephense/lib/intelephense.js', '--stdio'],
"    \ }

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

"call SetLSPShortcuts()

"set completeopt+=menuone,noselect,preview
"set shortmess+=c   " Shut off completion messages
"let g:mucomplete#enable_auto_at_startup = 1

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

"call ale#linter#Define('php', {
"\   'name': 'intelephense',
"\   'lsp': 'stdio',
"\   'executable': 'intelephense',
"\   'command': '%e --stdio',
"\   'project_root': '/home/erge/code/php/base',
"\})
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
