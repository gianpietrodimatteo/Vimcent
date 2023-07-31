""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Format the status line
set statusline=

" Path
"  set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m\
set statusline+=%=

" Encoding, file system, line column and position
"  set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ Ln\ %l\ Col\ %c
set statusline+=\ %p%%
set statusline+=\

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <leader>k :bp<CR>
nmap <leader>l :bn<CR>
nmap <leader>h :bd<CR>
nmap <leader>i :tabp<CR>
nmap <leader>o :tabn<CR>
nmap <leader>y :tabclose<CR>

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" Alt duplication
nmap <m-d> YP
vmap <m-d> YP
imap <m-d> <Esc>YPi

function! GitBranch()

  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

endfunction

" Format git branch information
function! StatuslineGit()

  let l:branchname = GitBranch()

  "  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''

endfunction

" From that other guy
augroup gitstatusline
  au!

  autocmd BufEnter,FocusGained,BufWritePost *
      \ let b:git_clean = system(printf("cd %s && git rev-parse --abbrev-ref 2>/dev/null", expand('%:p:h:S'))) is# ''
augroup end

let &statusline = '%{get(b:, "git_clean", "") ? "[clean]" : "[changed]"}'

set statusline+=%{StatuslineGit()}
set statusline+=b:git_clean

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" Some leader window mappings
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" Close tab
map <leader>r :tabclose<CR>
" New tab
map <leader>e :tabnew<cr>
" Close other tabs
map <leader>t :tabonly<cr>
" Move tab
map <leader>g :tabmove

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Do I need those?
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Turn off search highlighting using escape
nnoremap <esc> :noh<return><esc>
" This is needed because vim uses escape on its internal configuration
nnoremap <esc>^[ <esc>^[

" Set colorscheme
colorscheme desert

" Quick macros
nnoremap <leader><leader> @q

set timeout ttimeoutlen=50
