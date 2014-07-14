set nocompatible
:imap jk <Esc>
set autoindent
colorscheme desert
"set lines=38 columns=150
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

" move up and down using screen lines
nnoremap j gj
nnoremap k gk

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

nnoremap : ;
nnoremap ; :
nnoremap <S-k> :tabn<CR>
nnoremap <S-j> :tabp<CR>
nnoremap <S-t> :tabnew<CR>
inoremap <c-v> <esc>pa
" going around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" goto file opens new buffer
map gf <c-w>f

nnoremap <leader>s  :Scratch<cr>
" folding
nnoremap <space> za


let mapleader=","
set mouse= 
set relativenumber

" tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" loading and saving views (for folds)
augroup view_save
    autocmd!
    :au BufWinLeave ?* mkview
    :au BufWinEnter ?* silent loadview
augroup END

" editing and sourcing .gvimrc file
noremap <leader>ev :vsplit $MYGVIMRC<cr>
noremap <leader>sv :source $MYGVIMRC<cr>

set sessionoptions-=options
"call pathogen#infect()
syntax on
filetype off
filetype plugin indent on
filetype on

autocmd BufRead *.java set makeprg=ant\ -f\ build.xml 
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
