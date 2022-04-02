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
" file description: 
"   + fast and lighweight vim setup 
"   + this vim setup uses Vundle extension  
"   + generates rules for automatic backup of modified files 
"   + fzf file search setup 
"   + bottomline file management setup using 'lightline' vim package
"   + upperline tab management setup using 'lightline' fork vim package
"   + command customization
"

syntax on                   " enabling syntax highlighting and colouring 
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
set encoding=utf-8          " setting encoding -> for dev-icons

" if vim edits fortran files 
" fortran has a line limit of 80 characters per line or 132 character per line 
filetype detect
if (&filetype=='fortran')
    " setting 132 colorcolumn as indicator for fortran scripts
    set colorcolumn=132
    highlight ColorColumn ctermbg=0 guibg=lightgrey

    " configuring fortran syntax and rules 
    let fortran_free_source=1
    let fortran_have_tabs=1
    let fortran_more_precise=1
    let fortran_do_enddo=1
endif

call plug#begin('~/.vim/plugged')
    
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

call plug#end()

" vundle plugin 
set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'effi/vim-OpenFoam-syntax'

call vundle#end()         " required
filetype plugin indent on " required

" colorscheme setup 
colorscheme gruvbox         " setting up gruvbox 
set background=dark         " enabling dark mode 

" NERDtree setting
let NERDTreeShowHidden=1
" mapping NERDtree
map <C-n> :NERDTreeToggle<CR>                               

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

" fzf customization 
let $FZF_DEFAULT_COMMAND='find -L'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] 
  \}

" fzf statusline setup
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" fzf preview window setup
let g:fzf_preview_window = ['up:80%', 'ctrl-/']
let g:fzf_layout = { 'right': '55%' }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'up:80%' --margin=0 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" battery information setup
let g:battery#update_interval = 1000
let g:battery_watch_on_startup = 1
let g:battery#graph_width = 5
let g:battery#symbol_discharging = ' '
let g:battery#symbol_charging = '⚡'
let g:battery#component_format = "battery: %v%% %g %s"
let g:battery#update_statusline = 1 

" airline setup
set noshowmode
let g:airline_theme = 'gruvbox'

" tabline 
" -- separator
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" -- tab/buffer 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

" statusline 
" -- separator
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
" -- fonts 
let g:airline_powerline_fonts = 1
" -- status line
let g:airline#extensions#battery#enabled = 1
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = '%t' 
let g:airline_section_c = ''
let g:airline_section_x = '%p%% | %{battery#component()}' 
let g:airline_section_y = '%{fugitive#statusline()}'
let g:airline_section_z = '%{&filetype}'
let g:airline_section_warning = ''

" -- no showmode 
set noshowmode

" -- theme
let g:airline_theme = 'tomorrow'
