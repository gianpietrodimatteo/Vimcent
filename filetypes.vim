""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on line break on 80 characters
au FileType text setlocal tw=80

" Use 4 spaces sized tabs
au FileType text set noexpandtab shiftwidth=4 softtabstop=4

" Don't auto indent
au FileType text set noautoindent

" Don't display number
au FileType text set nonumber

" Highlight column 81 (on by default)
au FileType text set colorcolumn=81
