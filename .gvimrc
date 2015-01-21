set nocompatible
:imap jk <Esc>
set autoindent
colorscheme desert
set noswapfile
set lines=90 columns=160
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

" move up and down using screen lines
nnoremap j gj
nnoremap k gk

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
" open current split in new tab
nnoremap <c-t> :tabe %<CR>:tabp<CR>:q<CR>:tabn<CR>

" goto file opens new tab
map gf <c-w>gf

" folding
nnoremap <space> za


let mapleader=","

" key bindings for plugins
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>s  :Scratch<cr>

" tabs
set tabstop=4
set shiftwidth=4
"set smarttab
set expandtab

" smooth scroll
:nnoremap <S-u> <S-h>kkkkkkkkkkkkkkkkkkkkkkkkk
:nnoremap <S-d> <S-l>jjjjjjjjjjjjjjjjjjjjjjjjj

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
" call pathogen#infect()
syntax on
filetype off
filetype plugin indent on
filetype on

autocmd BufRead *.java set makeprg=ant\ -f\ build.xml 
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
