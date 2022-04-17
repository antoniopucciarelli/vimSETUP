" if vim edits fortran files 
" fortran has a line limit of 80 characters per line or 132 character per line 
filetype detect
if (&filetype=='fortran')
    " setting 132 colorcolumn as indicator for fortran scripts
    set colorcolumn=132
    highlight ColorColumn ctermbg=lightgreen 

    " configuring fortran syntax and rules 
    let fortran_free_source=1
    let fortran_have_tabs=1
    let fortran_more_precise=1
    let fortran_do_enddo=1
endif
