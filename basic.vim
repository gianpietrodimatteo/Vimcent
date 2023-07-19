""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to space
let mapleader=" " 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal emulator settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set term=kitty " Required for usage with kitty terminal emulator

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme desert

" Set colorscheme background
set background=dark

set termguicolors " Enable 24 bit RGB color

set laststatus=2 " Always display the status line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Turns off compatibility with vi
set mouse=a " Enables mouse support
syntax enable " Enables syntax highlighting
set encoding=utf-8 " Sets encoding shown in terminal
set fileencodings=utf-8 " Sets encoding of written files
set splitright splitbelow " Orientation of splitting windows
set ignorecase " Defaults search to ignore case

set incsearch " Highlight all search matches
set formatoptions-=cro " Disable automatic comenting on new line
set expandtab shiftwidth=2 softtabstop=2 " Use tab as 2 spaces
set autoindent " Enter mantains previous indentation
set tw=0 " Text width (line length) in characters. 0 means disabled
set matchpairs=(:),{:},[:],<:>,?:\: " % takes you to matching pairs
set number " Shows line numbers
set history=500 " Set command history to remember 500 commands
set hlsearch " Use highlighting when doing a search
set lazyredraw " Don't redraw while executing macros (good performance config)
set hidden " Allows you to leave buffer without saving it

" Activates filetype detection. This allows you to assign different syntax, 
" plugins and indentation for different file types
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete " Turns completion on 
set wildmode=longest,list,full " Adjustments on completion selection

" Backspace over indentation from autoindent
" Backspace over an end of line (eol) character
" Backspace past the position where you started Insert mode
set backspace=indent,eol,start  

" Use systems cut, copy and paste registers
set clipboard=unnamedplus

set wildmenu " Turn on wild menu
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Highlight column 81 (off by default)
highlight ColorColumn ctermbg=grey
set colorcolumn=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup, swap and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets location for viminfo file
wv ~/.vim/.viminfo
rv ~/.vim/.viminfo
set viminfo+=n~/.vim/.viminfo

" Turns off backup 
set nobackup
set nowb

" Sets vim swap folder
set directory=~/.vim/swap// " Swap

" Turn persistent undo on. This means that you can undo even when you close a 
" buffer/VIM
try
  set undodir=~/.vim/undo// " Undo
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Alt moves lines/selection up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Alt-c toggles ignore case
nmap <A-c> :set ignorecase! <CR> 

" BUFFERS
" WINDOWS
" TABS

" Move between windows
nmap <leader>j <C-W>h
nmap <leader>k <C-W>j
nmap <leader>l <C-W>k
nmap <leader>; <C-W>l

" Move between buffers
nmap <leader>d :bp<CR>
nmap <leader>f :bn<CR>

" Move between tabs
nmap <leader>a :tabp<CR>
nmap <leader>s :tabn<CR>

" Quick split window
nmap <leader>h :vsplit<Enter>

" Quick comment code
nmap <leader>/ gcc

" Close buffer
nmap <leader>w :bd<CR>
" Close all buffers
nmap <leader>q :bufdo bd<cr>

" Close tab
map <leader>r :tabclose<CR>
" New tab
"  map <leader>e :tabnew<cr>

" Close other tabs
map <leader>t :tabonly<cr>
" Move tab
map <leader>g :tabmove

" Opens a new tab within the current buffer's path
map <leader>e :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>v :cd %:p:h<cr>:pwd<cr>



" Spell-check e for english, i for portuguese
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>p :setlocal spell! spelllang=pt<CR>

" Toggle line wrap at 80 characters
nnoremap <leader>n :ToggleWrap<CR>

" Toggle highlighting column 81
nnoremap <leader>m :ToggleLineBreakHighlight<CR>

" Quick newline
nnoremap <leader>u o<Esc>
" Quick enter
nnoremap <leader>i i<Enter><Esc>

" Quick macros
nnoremap <leader><leader> @q

" Quick Omnicomplete (shift tab)
imap <s-tab> <C-X><C-O>

" Turn workspace features of current directory on and off
nnoremap <leader>, :ToggleWorkspace<CR>

" Turn autosave on and off
nnoremap <leader>. :ToggleAutosave<CR>

" Turn off search highlighting using shortcut
nnoremap <leader><Esc> :nohlsearch<CR>
" Turn off search highlighting using escape
"  nnoremap <esc> :noh<return><esc>
" This is needed because vim uses escape on its internal configuration
"  nnoremap <esc>^[ <esc>^[

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" WIP
" Disable execution mode mapping
nnoremap Q <nop>

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

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" WIP

" Search backward for selection
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR>
" Search forward for selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Correct indentation and apply line wrap on whole file
nnoremap <F2> :g/./ normal gqq<CR>:noh<CR>

" Correct indentation and apply line wrap on line
nnoremap <F3> V=Vgq<CR>

" Corrects indentation on file
nnoremap <F4> gg=G<C-o><C-o>

" Print time stamp
nnoremap <F5> :read !date<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Confirm quit
function! ConfirmQuit()
  if (&modified==1)
    if (confirm("Close this buffer and discard changes?", "&Yes\n&No", 2)==1)
      :quit!
    endif
  else
    :quit!
  endif
endfu

" Confirm quiting all buffers
function! ConfirmQuitAll()
  if (len(filter(getbufinfo(), 'v:val.changed == 1')) > 0)
    if (confirm("Close all buffers and discard changes?", "&Yes\n&No", 2)==1)
      :qa!
    endif
  else
    :qa!
  endif
endfu

" Toggle line wrapping at 80 characters
let s:wrapping = 0
function! ToggleWrapFunction()
  if s:wrapping == 0
    let s:wrapping = 1
    set tw=80
  else
    let s:wrapping = 0
    set tw=0
  endif
endfunction

command ToggleWrap call ToggleWrapFunction()

let s:highlightLineBreak = 0
function! ToggleLineBreakHighlightFunction()
    if s:highlightLineBreak == 0 
      let s:highlightLineBreak = 1
    set colorcolumn=81
  else
    let s:highlightLineBreak = 0
    set colorcolumn=0
  endif
endfunction

command ToggleLineBreakHighlight call ToggleLineBreakHighlightFunction()

" Delete swap files on save
function! DeleteSwapFiles()
  let si = trim(execute(":swapname"))[0:-4]
  call delete(si . 'swp')
  call delete(si . 'swo')
  call delete(si . 'swn')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Event hooks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Delete swap files on save
autocmd BufWritePost * call DeleteSwapFiles()
