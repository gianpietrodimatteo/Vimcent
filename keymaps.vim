""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps / Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Correct indentation and apply line wrap on whole file
nmap <F1> :g/./ normal gqq<CR>:noh<CR>

" Correct indentation and apply line wrap on line
nmap <F2> V=Vgq<CR>

" Corrects indentation on file
nmap <F3> gg=G<C-o><C-o>

" Print time stamp
nmap <F4> :read !date<CR>

"  " Turn workspace features of current directory on and off
"  nmap <F5> :ToggleWorkspace<CR>

"  " Turn autosave on and off
"  nmap <F6> :ToggleAutosave<CR>

" Switch CWD to the directory of the open buffer
nmap <F7> :cd %:p:h<cr>:pwd<cr>

" Spell-check e for english, i for portuguese
nmap <F8> :setlocal spell! spelllang=en_us<CR>
nmap <F9> :setlocal spell! spelllang=pt<CR>

" Toggle line wrap at 80 characters
nmap <F10> :ToggleWrap<CR>

" Toggle highlighting column 81
nmap <F11> :ToggleLineBreakHighlight<CR>

"  " Close any hidden buffers not currently tied to a tab window 
"  nmap <F12> :CloseHiddenBuffers<CR>

" Alt key combinations

"Alt moves lines/selection up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Alt-c toggles ignore case
nmap <A-c> :set ignorecase! <CR> 

" Buffer management
" Previous buffer
nmap <A-d> :bp<CR>
" Next buffer
nmap <A-f> :bn<CR>
" List buffers
nmap <A-a> :ls<CR>
" Open new buffer
nmap <A-s> :b 
" Go to last opened buffer
noremap <A-g> :e#<CR>
" Close buffer
nmap <A-w> :bd<CR>
" Close all buffers
nmap <A-e> :bufdo bd<cr>

" Window movement
nmap <A-h> <C-W>h
nmap <A-l> <C-W>l

" New line below cursor
nmap <A-CR> o<Esc>
imap <A-CR> <Esc>o
vmap <A-CR> <Esc>o<Esc>

" Line break on cursor
nmap <C-CR> i<CR><Esc>
vmap <C-CR> <Esc>i<CR><Esc>

" Split window
nmap <C-Bslash> :vsplit<CR>

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

" Disable execution mode mapping
nnoremap Q <nop>

"  " All modes 	Synonym 	Synonym for <C-V>. This key is used for flow control on the terminal. On modern machines most people have no use for flow control so you can run stty -ixon in your shell to unlock it for your own use.
"  noremap <C-Q>
"  " All modes 	Free 	Used for flow control like <C-Q>.
"  noremap <C-S>
"  " Normal 	Free 	This can also be entered with <C-Space>.
"  nnoremap <C-@>
"  " Normal 	Synonym 	Synonym for h.
"  nnoremap <C-H>
"  " Normal 	Synonym 	Synonym for j.
"  nnoremap <C-J>
"  " Normal 	Free
"  nmap <C-K>
"  " Normal 	Synonym 	Synonym for j.
"  nnoremap <C-N>
"  " Normal 	Synonym 	Synonym for k.
"  nnoremap <C-P>
"  " Normal 	Free 	This can also be typed as <Esc>.
"  nmap <C-[>
"  " Normal 	Free 	This can also be typed as <C-/>.
"  nmap <C-_>
"  " Normal 	Synonym 	Synonym for <CR>.
"  nnoremap +
"  " Normal 		By default, this is an inferior version of <Leader>K that can be obtained through man.vim with runtime! ftplugin/man.vim. See :help find-manpage for more.
"  nmap K
"  " Normal 	Synonym 	Synonym for yy. However, many people like to map this to y$ to match the behavior of C and D.
"  nnoremap Y
"  " Normal 		This is nearly the same as <CR>. The documentation (:help maplocalleader) even mentions the underscore as an example of a key that can be used for the local leader.
"  nnoremap _
"  " Normal 	Synonym 	Synonym for cl.
"  nnoremap s
"  " Normal 	Synonym 	Synonym for dl. However, it is handy to be able to repeat x several times in a row, whereas repeating dl gets cumbersome. (A similar problem does not exist for s and cl, since there is no point in repeating it.)
"  nnoremap x
"  " Normal 	Synonym 	Synonym for x.
"  nnoremap <Del>
"  " Visual 	Free 	This can also be entered with <C-Space>.
"  vmap <C-@>
"  " Visual 	Synonym 	Synonym for h (or <BS> in select mode).
"  vnoremap <C-H>
"  " Visual 	Free 	This is the <Tab> key, which does nothing in visual mode.
"  vmap <C-I>
"  " Visual 	Synonym 	Synonym for j.
"  vnoremap <C-J>
"  " Visual 	Free
"  vmap <C-K>
"  " Visual 	Synonym 	Synonym for j.
"  vnoremap <C-N>
"  " Visual 	Free 	In select mode, this switches to visual mode for one command. Mapping with xnoremap will map it only for visual mode while preserving the default behavior in select mode. See :help mapmode-x for more.
"  vmap <C-O>
"  " Visual 	Synonym 	Synonym for k.
"  vnoremap <C-P>
"  " Visual 	Free
"  vmap <C-R>
"  " Visual 	Free
"  vmap <C-T>
"  " Visual 	Free
"  vmap <C-^>
"  " Visual 	Free 	This can also be typed as <C-/>.
"  vmap <C-_>
"  " Visual 	Free
"  vmap &
"  " Visual 	Synonym 	Synonym for <CR>.
"  vnoremap +
"  " Visual 	Free
"  vmap .
"  " Visual 	Synonym 	Synonym for p.
"  vnoremap P
"  " Visual 	Free
"  vmap Q
"  " Visual 	Synonym 	Synonym for S. However, the documentation \" (:help v_R) says \"In a next version it might work differently.\"
"  vnoremap R
"  " Visual 	Free 	Z in visual mode waits for a following key, as seen if 'showcmd' is set. However, neither ZZ nor ZQ do anything (as in normal mode), and no other key combination is listed in the index, so it appears that Z actually does nothing in visual mode.
"  vmap Z
"  " Visual 		Nearly the same as <CR>.
"  vnoremap _
"  " Visual 	Synonym 	Synonym for c.
"  vnoremap s
"  " Visual 	Synonym 	Synonym for d.
"  vnoremap x
"  " Visual 	Synonym 	Synonym for d.
"  vnoremap <Del>
"  " Insert 	Free
"  imap <C-B>
"  " Insert 	Synonym 	Synonym for <CR>.
"  inoremap <C-J>
"  " Insert 	Free 	Unless 'insertmode' is set.
"  imap <C-Z>
"  " Insert 	Free 	This can also be typed as <C-/>.
"  imap <C-_>


" open file
nmap <A-o> :e 

" Opens a new tab within the current buffer's path
map <leader>e :tabedit <C-r>=expand("%:p:h")<cr>/

" Turn off search highlighting using shortcut
nnoremap <leader><Esc> :nohlsearch<CR>

" Load all folder files into buffers
noremap <Leader>l :args *<CR>

" Another buffer list command
noremap <Leader>j :ls<CR>

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

" Search backward for selection
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR>
" Search forward for selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Delete current file
nmap <C-Del> :call ConfirmDeleteCurrentFile()<CR>

" New empty file
nmap <C-n> :enew<CR>
"  File operations:
"  	New
"  	Open
"  	Save
"  	Save as
"  	Delete

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

" Fix cedilla
inoremap ć ç

" File management
" Buffer management
" Tab management
" Window management
" Editor keys
" VIM keys
