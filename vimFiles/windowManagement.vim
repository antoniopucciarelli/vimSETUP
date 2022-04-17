" window management
" window splitting position
set splitbelow " splitting new window below the active one  
set splitright " splitting new window at the right of the active one 

" window size adjustability
noremap <C-l> :vertical resize +3<CR>
noremap <C-h> :vertical resize -3<CR>
noremap <C-k> :resize +3<CR>
noremap <C-j> :resize -3<CR>
