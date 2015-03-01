set nocompatible
:imap jk <Esc>
set autoindent
colorscheme desert
set noswapfile
set lines=90 columns=160

" move up and down using screen lines
nnoremap j gj
nnoremap k gk
set mouse=

nnoremap : ;
nnoremap ; :
" Use Shift hj keys for buffers, not tabs
nnoremap <S-k> :bn<CR>
nnoremap <S-j> :bp<CR>
nnoremap <S-x> :bp<CR>:bd #<CR>
nnoremap <S-t> :e<CR>

"nnoremap <S-k> :tabn<CR>
"nnoremap <S-j> :tabp<CR>
"nnoremap <S-t> :tabnew<CR>
inoremap <c-v> <esc>pa
" going around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" open current split in new tab
nnoremap <c-t> :tabe %<CR>:tabp<CR>:q<CR>:tabn<CR>


" folding
nnoremap <space> za


let mapleader=","

" key bindings for plugins
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>s  :Scratch<cr>
" FuzzyFinder bindings
nnoremap <leader>b :FufBuffer<CR>
nnoremap <leader>f :FufFile<CR>

" tabs
set tabstop=2
set shiftwidth=2
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

" prevent bad NerdTree behaviour on Stanford corn
let g:NERDTreeDirArrows=0

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" For airline to show without having to open a new split
set laststatus=2
set hidden
