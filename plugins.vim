"------------------------------------------------------------------------------
" Cutlass
"------------------------------------------------------------------------------

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

"------------------------------------------------------------------------------
" Workspace
"------------------------------------------------------------------------------

" Close any hidden buffers not currently tied to a tab window
nmap <F3> :CloseHiddenBuffers<CR>

" Turn workspace features of current directory on and off
nmap <F4> :ToggleWorkspace<CR>

" Turn autosave on and off
nmap <F5> :ToggleAutosave<CR>

" Automaticaly activate session tracking
"  let g:workspace_autocreate = 1

" Open new file on new tab (1) or on new buffer on same tab (0)
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0

" Autosave even outside of session
"  let g:workspace_autosave_always = 1

" Disable autosave
"  let g:workspace_autosave = 0

" Save all your session files in a single directory outside of your workspace
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" Set undodir
let g:workspace_undodir = $HOME . '/.vim/undo'

"------------------------------------------------------------------------------
" Lightline and vim-gitbranch
"------------------------------------------------------------------------------

" Use filename or absolutepath
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"------------------------------------------------------------------------------
" Gruvbox
"------------------------------------------------------------------------------

" Gruvbox contrast settings
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

"------------------------------------------------------------------------------
" LazyList
"------------------------------------------------------------------------------

" Note the space after the command
nnoremap gli :LazyList 
vnoremap gli :LazyList 
let g:lazylist_omap = 'il'
let g:lazylist_maps = [
			\ 'gl',
			\ {
				\ 'l'  : '',
				\ '*'  : '* ',
				\ '-'   : '- ',
				\ 't'   : '- [ ] ',
				\ '2'  : '%2%. ',
				\ '3'  : '%3%. ',
				\ '4'  : '%4%. ',
				\ '5'  : '%5%. ',
				\ '6'  : '%6%. ',
				\ '7'  : '%7%. ',
				\ '8'  : '%8%. ',
				\ '9'  : '%9%. ',
				\ '.1' : '1.%1%. ',
				\ '.2' : '2.%1%. ',
				\ '.3' : '3.%1%. ',
				\ '.4' : '4.%1%. ',
				\ '.5' : '5.%1%. ',
				\ '.6' : '6.%1%. ',
				\ '.7' : '7.%1%. ',
				\ '.8' : '8.%1%. ',
				\ '.9' : '9.%1%. ',
			\ }
		\ ]

"------------------------------------------------------------------------------
"  Bullets
"------------------------------------------------------------------------------

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]           

"------------------------------------------------------------------------------
"  Ack
"------------------------------------------------------------------------------

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack<Space>

" Search for word beneath the cursor
noremap <Leader>a :Ack <cword><cr>

" When you press <leader>r you can search and replace the selected text
" On the same file, not everywhere*
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
