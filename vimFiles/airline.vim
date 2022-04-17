" airline setup

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
let g:airline_section_c = '%c : %l / %L'
let g:airline_section_x = '%p%% | %{battery#component()}' 
let g:airline_section_y = '%{fugitive#statusline()}'
let g:airline_section_z = '%{&filetype}'
let g:airline_section_warning = ''
let g:airline_section_error = ''

" -- no showmode 
set noshowmode

" -- theme
let g:airline_theme_map = 'gruvbox.*' 
