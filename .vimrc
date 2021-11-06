syntax on 

set ruler 
set noerrorbells 

set nu 

set softtabstop=4
set shiftwidth=4
set noswapfile 
set tabstop=4
set expandtab 
set smartcase  
set undodir=~/.vim/undodir 
set undofile 
set incsearch 
set clipboard=unnamedplus

set colorcolumn=132
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
    
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'    
    Plug 'itchyny/lightline.vim'
    " A Vim Plugin for Lively Previewing LaTeX PDF Output
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" vundle plugin 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'effi/vim-OpenFoam-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox 
set background=dark 

" NERDtree setting
" mappint nerdtree 
map <C-n> :NERDTreeToggle<CR>
" starting automatically nerdtree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" This line turns on backups:
set backup
set backupdir=~/Backup/vimBackup/
set writebackup
set backupcopy=yes
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") 

" wrapping lines mapping character 
set whichwrap+=<,>,h,l,[,]

" window management
" window splitting position
set splitbelow splitright

" window size adjustability
noremap <C-l> :vertical resize +3<CR>
noremap <C-h> :vertical resize -3<CR>
noremap <C-k> :resize +3<CR>
noremap <C-j> :resize -3<CR>

" setting indentation folding 
set foldmethod=indent 

" configuring fortran syntax and rules 
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" visual mode tab and S-tab mapping
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" set up lightline status [insert, replace, ...]
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" adding whole text selection mapping 
map <C-a> <esc>ggVG<CR>

" setting mouse scrollng
set mouse=nicr
set mouse=a

" latex support 
let g:livepreview_previewer = 'evince'
let g:livepreview_use_biber = 1
let g:livepreview_cursorhold_recompile = 0
set updatetime=1000
