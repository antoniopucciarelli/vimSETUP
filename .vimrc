"
" file: .vimrc 
" author: antonio pucciarelli
" github: antoniopucciarelli
"

syntax on                   " enables syntax highlighting 
set ruler                   " enable cursor position information in file 
set noerrorbells            " disable ring bell for error messages  
set number                  " enables line numbers identification -- switch to relativenumber for relative position in file  
set relativenumber          " enables relative number lines
set softtabstop=4           " number of spaces used in the editing mode  
set shiftwidth=4            "  
set noswapfile              " disabling swap file generation -> enabling backup files as replacement 
set tabstop=4               " association of spaces to tab command 
set expandtab               " converts tabs into spaces  
set undodir=~/.vim/undodir  " settnig undo directory for the undo command
set undofile                " enabling undo 
set history=10              " setting typing changes history 
set clipboard=unnamedplus   "  
set cursorline              " enabling cursorline highlighting 
set cursorlineopt=both      " this option allows using both number and line highlighting for the cursorline command
set nowrap                  " this option disable the wrapping of lines  
set encoding=utf-8          " encoding set as utf-8
set wildchar=<TAB>          " setting wildchar character 
set foldmethod=indent       " setting fold method -> every indentation is treated as a folding source  
set whichwrap+=<,>,h,l,[,]  " setting wrapping lines method

call plug#begin('~/.vim/plugged')
    
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lambdalisue/battery.vim'
    Plug 'lervag/vimtex'
    Plug 'rudrab/vimf90'
    Plug 'effi/vim-OpenFoam-syntax'

call plug#end()

" visual mode tab and S-tab mapping
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" adding whole text selection mapping 
map <C-a> <esc>ggVG<CR>

" setting mouse scrollng
set mouse=nicr
set mouse=a

" setting searching rules 
set ignorecase 
set incsearch 
set smartcase 

" avoid mistyping commands
command! W w
command! Wq wq
command! Q q
command! WQ wq

" loading .vimrc additional setup files  
runtime vimFiles/colorscheme.vim            " colorscheme 
runtime vimFiles/fzf.vim                    " fzf extension  
runtime vimFiles/battery.vim                " battery extension 
runtime vimFiles/airline.vim                " airline extension 
runtime vimFiles/nerdTree.vim               " nerdtree extension    
runtime vimFiles/fortran.vim                " fortran customization 
runtime vimFiles/windowManagement.vim       " window management 
runtime vimFiles/backup.vim                 " backup 

