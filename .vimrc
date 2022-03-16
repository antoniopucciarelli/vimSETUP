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
"

syntax on                   " enabling syntax highlighting and colouring 
set ruler                   " enable cursor position information in file 
set noerrorbells            " disable ring bell for error messages  
set number                  " enables line numbers identification -- switch to relativenumber for relative position in file  
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

" if vim treats with fortran file
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
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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
" mapping nerdtree 
map <C-n> :NERDTreeToggle<CR>
" starting automatically nerdtree
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif

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
set splitbelow 
set splitright

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

" set up lightline status
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified' ],
      \             [ 'gitbranch' ] ],
      \   'right': [ [ 'percent', 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \}

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

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

"autocmd! User FzfStatusLine call <SID>fzf_statusline()
let g:fzf_preview_window = ['up:80%', 'ctrl-/']
let g:fzf_layout = { 'right': '55%' }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'up:80%' --margin=0 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
