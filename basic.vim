""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" " " Set to space

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always display the status line

" Format the status line
set statusline=

" Git branch
"  set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}

" Path
"  set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m\ 
set statusline+=%=

" Encoding, file system, line column and position
"  set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ Ln\ %l\ Col\ %c
set statusline+=\ %p%%
set statusline+=\ 

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
nnoremap <M-c> :set ignorecase! <CR> " Maps alt c to toggle ignore case
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

" Moving lines
nmap <leader>j Vmp
nmap <leader>k VmkP

" Moving through buffers
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>

nnoremap <leader>s :ToggleWrap<CR>

nnoremap <leader>a :ToggleLineBreakHighlight<CR>

" Quick newline
nnoremap <leader><Enter> o<Esc>

" Quick macros
nnoremap <Space>q @q

" Ctrl+a select all
nnoremap <C-a> ggVG

"  Search for selection
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Correct indentation and apply line wrap
nnoremap <m-f> V=Vgq<CR>
" Correctly indent the whole file motherfuckerrr
nnoremap <leader>f :g/./ normal gqq<CR>:noh<CR>

" F7 corrects indentation
nnoremap <F7> gg=G<C-o><C-o>

" Print time stamp
nnoremap <F2> :read !date<CR>

" Escaping on normal mode turns off search highlighting
nnoremap <Esc> :nohlsearch<CR>

" Prompt before force quitting
cnoremap <silent> q!<CR>  :call ConfirmQuit()<CR>
nmap ZQ :call ConfirmQuit()<CR>
cnoremap <silent> qa!<CR>  :call ConfirmQuitAll()<CR>

" Easy quit, save, one or all
nnoremap ZW :call ConfirmQuitAll()<CR> " Quit without saving all
nnoremap ZS :wa<CR> " Save all
nnoremap ZA :update<CR> " Save current buffer
nnoremap ZX :xa<CR> " Save all and quit

" => Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Quick source current configuration file
nmap <leader><leader>o :so %<Enter>

" Remapping cxco to ctrl+space
imap <C-Space> <C-X><C-O>

" Make easy enter
nnoremap <leader><Enter> i<Enter><Esc>

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

" Get branch information
function! GitBranch()

  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

endfunction

" Format git branch information
function! StatuslineGit()

  let l:branchname = GitBranch()

  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Event hooks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Delete swap files on save
autocmd BufWritePost * call DeleteSwapFiles()
