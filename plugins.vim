""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cutlass
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Workspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn workspace features of current directory on and off
nmap <F5> :ToggleWorkspace<CR>

" Turn autosave on and off
nmap <F6> :ToggleAutosave<CR>

" Close any hidden buffers not currently tied to a tab window 
nmap <F12> :CloseHiddenBuffers<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline and vim-gitbranch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gruvbox contrast settings
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
      