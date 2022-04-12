"     ........  =-.             
"  -#########*:===::#*#######* 
"  .:*%%%%%#-::---=:=%%%%%%#+: 
"    *%#%#%#::=----*%%#%%#+:   
"    *%#%#%#::---*%%##%#+:     
"    *%#%#%#::=*%%##%%+-:=-.   
" .=-*%#%#%*-*%%##%%+-:---==-. 
" ==:*%#%#%#%%#%%#*-:-------=- 
"  ..*%#%%%%##%#++.-=------:   
"    *%#%%##%%*::--------:     
"    *%###%%*-.++::+*=-*+:-*=  
"    *%#%%*-::=%---%-:-%: -%:  
"    +##*-  -:%=::#=  *=  *+   
"     ..     .-:-:.   .   .    
"              ..              
"
" author: antonio pucciarelli
" github: antoniopucciarelli
"
syntax on                   " enables syntax highlighting 
set ruler                   " enable cursor position information in file 
set noerrorbells            " disable ring bell for error messages  
set number                  " enables line numbers identification -- switch to relativenumber for relative position in file  
set relativenumber          " enables relative number lines
set softtabstop=4           " number of zpaces used in the editing mode  
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
set encoding=utf-8          " setting encoding -> for dev-icons
set wildchar=<TAB>          " setting wildchar character 

call plug#begin('~/.vim/plugged')
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lambdalisue/battery.vim'
    Plug 'lervag/vimtex'
    Plug 'rudrab/vimf90'
    Plug 'VundleVim/Vundle.vim'
    Plug 'effi/vim-OpenFoam-syntax'

call plug#end()

" these lines turn on backups (alternative to swap files):
set backup
set backupdir=~/Backup/vimBackup/
set writebackup
set backupcopy=yes
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") 

" wrapping lines mapping character 
set whichwrap+=<,>,h,l,[,]

" window management
" window splitting position
set splitbelow " splitting new window below the active one  
set splitright " splitting new window at the right of the active one 

" window size adjustability
noremap <C-l> :vertical resize +3<CR>
noremap <C-h> :vertical resize -3<CR>
noremap <C-k> :resize +3<CR>
noremap <C-j> :resize -3<CR>

" setting indentation folding 
set foldmethod=indent 

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

" loading .vimrc 
runtime vimFiles/fzf.vim
runtime vimFiles/battery.vim 
runtime vimFiles/airline.vim
runtime vimFiles/colorscheme.vim
runtime vimFiles/nerdTree.vim
runtime vimFiles/fortran.vim
