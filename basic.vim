"------------------------------------------------------------------------------
" Leader
"------------------------------------------------------------------------------

" Set to space
let mapleader=" "

"------------------------------------------------------------------------------
" Terminal emulator settings
"------------------------------------------------------------------------------

set term=kitty " Required for usage with kitty terminal emulator

"------------------------------------------------------------------------------
" Appearence
"------------------------------------------------------------------------------

set background=dark

set termguicolors " Enable 24 bit RGB color

set laststatus=2 " Always display the status line

"------------------------------------------------------------------------------
" Basic settings
"------------------------------------------------------------------------------

set nocompatible " Turns off compatibility with vi
set mouse=a " Enables mouse support
syntax enable " Enables syntax highlighting
set encoding=utf-8 " Sets encoding shown in terminal
set fileencodings=utf-8 " Sets encoding of written files
set splitright splitbelow " Orientation of splitting windows
set ignorecase " Defaults search to ignore case
set incsearch " Highlight all search matches
" Disable automatic comenting on new line
set fo-=c fo-=r fo-=o
set expandtab shiftwidth=2 softtabstop=2 " Use tab as 2 spaces
set autoindent " Enter mantains previous indentation
set tw=0 " Text width (line length) in characters. 0 means disabled
set matchpairs=(:),{:},[:],<:>,?:\: " % takes you to matching pairs
set number " Shows line numbers
set history=500 " Set command history to remember 500 commands
set hlsearch " Use highlighting when doing a search
set lazyredraw " Don't redraw while executing macros (good performance config)
set hidden " Allows you to leave buffer without saving it

" Send cursor to adjacent line when moving sideways (arrow keys or hl)
set whichwrap+=<,>,h,l

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
" Wildmenu will ignore files with these extensions:
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Highlight column 81 (off by default)
highlight ColorColumn ctermbg=grey
set colorcolumn=0

" Quickly time out key codes
set ttimeout ttimeoutlen=50

"------------------------------------------------------------------------------
" Backup, swap and undo
"------------------------------------------------------------------------------

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

"------------------------------------------------------------------------------
" Functions and commands
"------------------------------------------------------------------------------

" Confirm delete current file and buffer
function! ConfirmDeleteCurrentFile()
  if (confirm("Delete this file?", "&Yes\n&No", 2)==1)
    :call delete(expand('%')) | bdelete!
  endif
endfu

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

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

" Easier Ack usage
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"------------------------------------------------------------------------------
" Event hooks
"------------------------------------------------------------------------------

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Delete swap files on save
autocmd BufWritePost * call DeleteSwapFiles()

" Make sure to set formatoptions for all filetypes
au FileType * setlocal formatoptions-=cro

