""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.txt setlocal tw=80

" TODO make text mode here
au FileType txt inoremap <buffer> $r return 


au FileType python inoremap <buffer> $r return 
"  au FileType python inoremap <buffer> $r return 

" DISABLE IN TEXTMODE
" Use tab as 2 spaces
set expandtab shiftwidth=2 softtabstop=2 

" DISABLE IN TEXTMODE
" Enter mantains previous indentation
set autoindent

" DISABLE IN TEXT MODE
set number

" TURN AUTOSAVE ON

" TURN LINE BREAKING ON
" SHOW THE MAGIC BAR

" Highlight color 81 ENABLE IN TEXT MODE for sure
highlight ColorColumn ctermbg=grey
set colorcolumn=81