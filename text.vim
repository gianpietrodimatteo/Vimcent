"------------------------------------------------------------------------------
" Text files configuration
"------------------------------------------------------------------------------

" Turn on line break on 80 characters
set tw=80

" Use 4 spaces sized tabs
set noexpandtab softtabstop=4
setlocal shiftwidth=4

" Don't auto indent
set noautoindent

filetype indent off

" Don't display number
setlocal nonumber

" Highlight column 81 (on by default)
set colorcolumn=81

" Simpler text formatting (needs empty line to separate paragraphs)
" Takes lists into consideration
setlocal formatoptions=tqn

" Format line into paragraph
nmap gqt I<Tab><Esc>gqgq

