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

" Session tracking activated automatically
let g:workspace_autocreate = 1
" Save all your session files in a single directory outside of your workspace
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" Set undodir
let g:workspace_undodir = $HOME . '/.vim/undo'

" Create a new buffer in the existing tab instead of creating a new tab
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0
" Turn workspace features of current directory on and off
"  nnoremap <leader>s :ToggleWorkspace<CR>

" Autosave on even outside of session
"  let g:workspace_autosave_always = 1
" Autosave off by default
let g:workspace_autosave = 0
" Turn autosave on and off
"  nnoremap <leader>a :ToggleAutosave<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
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

" Current choice
colorscheme gruvbox
      