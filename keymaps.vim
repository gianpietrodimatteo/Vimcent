"------------------------------------------------------------------------------
" F keys
"------------------------------------------------------------------------------

" Correct indentation and apply line wrap on whole file
nmap <F1> :g/./ normal gqq<CR>:noh<CR>

" Switch CWD to the directory of the open buffer
nmap <F2> :cd %:p:h<cr>:pwd<cr>

"  " Close any hidden buffers not currently tied to a tab window
"  nmap <F3> :CloseHiddenBuffers<CR>

"  " Turn workspace features of current directory on and off
"  nmap <F4> :ToggleWorkspace<CR>

"  " Turn autosave on and off
"  nmap <F5> :ToggleAutosave<CR>

" Print time stamp
nmap <F10> :read !date<CR>

" Toggle line wrap at 80 characters
" nmap <F11> :ToggleWrap<CR>

" Toggle line wrap and column 81 highlight
nmap <F12> :call ToggleLineBreakHighlightFunction() <bar> call ToggleWrapFunction()<CR>

" nmap <F12> :ToggleLineBreakHighlight<CR>

"------------------------------------------------------------------------------
" Editor commands
"------------------------------------------------------------------------------

"Alt moves lines/selection up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Alt-c toggles ignore case
nmap <A-c> :set ignorecase! <CR>

" New line below cursor
nnoremap <C-CR> o<Esc>
inoremap <C-CR> <Esc>o
vnoremap <C-CR> <Esc>o<Esc>

" Line break on cursor
nnoremap <A-CR> i<CR><Esc>
vnoremap <A-CR> <Esc>i<CR><Esc>

" Insert space
nnoremap <A-Space> i<Space><Esc>

" Comment line
nmap <C-/> gcc
imap <C-/> <Esc>gcci
vmap <C-/> gc

" Quick Omnicomplete
imap <C-Space> <C-X><C-O>

" Alt n duplication
nmap <A-n> YP
vmap <A-n> YP
imap <A-n> <Esc>YPi

" Quick macros
nmap <A-q> @q

" Turn off search highlighting using shortcut
" nnoremap <leader><Esc> :nohlsearch<CR>
nnoremap <Leader>/ :noh<CR>

" Search backward for selection
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR>
" Search forward for selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Remove carriage return ^M characters (and substitute for newline)
nnoremap ZM :%s/\r/\r/g

"------------------------------------------------------------------------------
" Buffer management
"------------------------------------------------------------------------------

" List and select buffers
nmap <F6> :buffers<CR>:buffer<Space>
" Close buffer
nmap <A-F6> :bd<CR>

" Previous buffer
nmap <F7> :bp<CR>
" Go to last opened buffer
noremap <A-F7> :e#<CR>
" Next buffer
nmap <F8> :bn<CR>

" Close all buffers
nmap <C-F6> :bufdo bd<cr>

" Load all folder files into buffers
noremap <C-F8> :args *<CR>

" Go to buffer number
nnoremap <A-1> :1b<CR>
nnoremap <A-2> :2b<CR>
nnoremap <A-3> :3b<CR>
nnoremap <A-4> :4b<CR>
nnoremap <A-5> :5b<CR>
nnoremap <A-6> :6b<CR>
nnoremap <A-7> :7b<CR>
nnoremap <A-8> :8b<CR>
nnoremap <A-9> :9b<CR>
nnoremap <A-0> :10b<CR>

"------------------------------------------------------------------------------
" Window management
"------------------------------------------------------------------------------

" Window movement
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Split window vertically
nmap <C-Bslash> :vsplit<CR>

"------------------------------------------------------------------------------
" File management
"------------------------------------------------------------------------------

" Prompt before force quitting
cnoremap <silent> q!<CR>  :call ConfirmQuit()<CR>
nmap ZQ :call ConfirmQuit()<CR>
cnoremap <silent> qa!<CR>  :call ConfirmQuitAll()<CR>

" Quit without saving all
nnoremap ZW :call ConfirmQuitAll()<CR>
" Save all
nnoremap ZS :wa<CR>
" Save current buffer
nnoremap ZA :update<CR>
" Save all and quit
nnoremap ZX :xa<CR>
" Open file
nnoremap ZO :e<space>
" New empty file
nnoremap ZN :enew<CR>
" Save as
nnoremap ZC :w<space>
" Delete current file
nnoremap ZD :call ConfirmDeleteCurrentFile()<CR>

" Quick print current directory
" nmap <Leader>w :pwd<CR>

"------------------------------------------------------------------------------
" Other configurations
"------------------------------------------------------------------------------

" Fix cedilla
inoremap ć ç

" Disable execution mode mapping
nnoremap Q <nop>

