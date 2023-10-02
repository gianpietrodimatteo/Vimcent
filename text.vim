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

" TODO make it recognize 1.2 1.3 etc as well
set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
set formatlistpat+=\\(                      " |  Start group
set formatlistpat+=[0-9]\\+                 " |  |  Numbers
set formatlistpat+=\\\|                     " |  |  or
set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
set formatlistpat+=\\)                      " |  End group
set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points

" Format line into paragraph
nmap gqt I<Tab><Esc>gqgq

" Turn autosave on
"  au BufRead,BufNewFile *.txt let g:workspace_autosave = 1

